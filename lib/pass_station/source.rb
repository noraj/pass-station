# frozen_string_literal: true

# Ruby internal
require 'net/https'
require 'tmpdir'

# Pass Station module
module PassStation
  # Password database handling
  class DB
    UPSTREAM_DATABASE = {
      MAPPING: {
        1 => :DEFAULT_CREDENTIALS_CHEAT_SHEET,
        2 => :MANY_PASSWORDS
      },
      DEFAULT_CREDENTIALS_CHEAT_SHEET: {
        URL: 'https://raw.githubusercontent.com/ihebski/DefaultCreds-cheat-sheet/main/DefaultCreds-Cheat-Sheet.csv',
        HASH: 'f03f3ed77a8a932b1b2891fbec705d42b1eec4911fb76ccf36cde9e79a385556',
        FILENAME: 'DefaultCreds-Cheat-Sheet.csv',
        COLUMNS: {
          productvendor: 'Product/Vendor',
          username: 'Username',
          password: 'Password'
        }
      },
      MANY_PASSWORDS: {
        URL: 'https://raw.githubusercontent.com/many-passwords/many-passwords/main/passwords.csv',
        HASH: '293ce4411446c702aeda977b9a446ff42d045d980be0b5287a848b5bd7d39402',
        FILENAME: 'many-passwords.csv',
        COLUMNS: {
          vendor: 'Vendor',
          modelsoftware_name: 'Model/Software name',
          version: 'Version',
          access_type: 'Access Type',
          username: 'Username',
          password: 'Password',
          privileges: 'Privileges',
          notes: 'Notes'
        }
      }
    }.freeze

    class << self
      # Download upstream password database
      # @param destination_path [String] the destination path (may
      #   overwrite existing file).
      # @param opts [Hash] the optional download parameters.
      # @option opts [String] :sha256 the SHA256 hash to check, if the file
      #   already exist and the hash matches then the download will be skipped.
      # @option opts [String] :source_db id of the source database (see. MAPPING in {UPSTREAM_DATABASE}). Default is 1.
      # @return [String|nil] the saved file path.
      def download_upstream(destination_path, opts = {})
        opts[:source_db] ||= 1
        source_db = UPSTREAM_DATABASE[:MAPPING][opts[:source_db]]
        opts[:filename] = UPSTREAM_DATABASE[source_db][:FILENAME]
        source_url = UPSTREAM_DATABASE[source_db][:URL]
        download_file(source_url, destination_path, opts)
      end

      # Check if an update is available
      # @return [Boolean] `true` if there is, `false` else.
      def check_for_update
        ret_vals = []
        UPSTREAM_DATABASE[:MAPPING].each_value do |v|
          file = download_file(UPSTREAM_DATABASE[v][:URL], Dir.mktmpdir)
          # Same hash = no update
          ret_vals << !check_hash(file, UPSTREAM_DATABASE[v][:HASH])
        end
        ret_vals.inject(:|) # logical OR, there is an update if at least one entry needs one
      end

      # Download a file.
      # @param file_url [String] the URL of the file.
      # @param destination_path [String] the destination path (may
      #   overwrite existing file).
      # @param opts [Hash] the optional download parameters.
      # @option opts [String] :sha256 the SHA256 hash to check, if the file
      #   already exist and the hash matches then the download will be skipped.
      # @option opts [String] :filename override upstream filename
      # @return [String|nil] the saved file path.
      def download_file(file_url, destination_path, opts = {})
        opts[:sha256] ||= nil

        destination_path += '/' unless destination_path[-1] == '/'
        uri = URI(file_url)
        opts[:filename] ||= uri.path.split('/').last
        destination_file = destination_path + opts[:filename]
        # Verify hash to see if it is the latest
        skip_download = check_hash(destination_file, opts[:sha256])
        write_file(destination_file, fetch_file(uri)) unless skip_download
      end

      # Check if a file match a SHA256 hash
      # @param file [String] the path of the file.
      # @param hash [String] tha SHA256 hash to check against.
      # @return [Boolean] if the hash of the file matched the one provided (`true`)
      #   or not (`false`).
      def check_hash(file, hash)
        if !hash.nil? && File.file?(file)
          computed_h = Digest::SHA256.file(file)
          true if hash.casecmp(computed_h.hexdigest).zero?
        else
          false
        end
      end

      # Just fetch a file
      # @param uri [URI] the URI to of the file
      # @return [Bytes] the content of the file
      def fetch_file(uri)
        res = Net::HTTP.get_response(uri)
        raise "#{file_url} ended with #{res.code} #{res.message}" unless res.is_a?(Net::HTTPSuccess)

        res.body
      end

      # Write a file to disk
      # @param destination_file [String] the file path where the fiel will be
      #   written to disk
      # @param file_content [String] the content to write in the file
      # @return [String] destination file path
      def write_file(destination_file, file_content)
        File.binwrite(destination_file, file_content)
        destination_file
      end

      # https://github.com/lsegal/yard/issues/1372
      protected :download_file, :check_hash, :fetch_file, :write_file
    end
  end
end
