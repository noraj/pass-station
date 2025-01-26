# frozen_string_literal: true

require_relative 'lib/pass_station/version'

Gem::Specification.new do |s|
  s.name          = 'pass-station'
  s.version       = Version::VERSION
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'CLI & library to search for default credentials among thousands of Products / Vendors'
  s.description   = 'CLI & library to search for default credentials among thousands of Products / Vendors'
  s.authors       = ['Alexandre ZANNI']
  s.email         = 'alexandre.zanni@engineer.com'
  s.homepage      = 'https://noraj.github.io/pass-station/'
  s.license       = 'MIT'

  s.files         = Dir['bin/*'] + Dir['lib/**/*.rb'] + Dir['data/*.csv']
  s.files        += ['LICENSE']
  s.bindir        = 'bin'
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.metadata = {
    'yard.run'              => 'yard',
    'bug_tracker_uri'       => 'https://github.com/noraj/pass-station/issues',
    'changelog_uri'         => 'https://github.com/noraj/pass-station/blob/master/docs/CHANGELOG.md',
    'documentation_uri'     => 'https://noraj.github.io/pass-station/yard/',
    'homepage_uri'          => 'https://noraj.github.io/pass-station/',
    'source_code_uri'       => 'https://github.com/noraj/pass-station/',
    'funding_uri'           => 'https://github.com/sponsors/noraj',
    'rubygems_mfa_required' => 'true'
  }

  s.required_ruby_version = ['>= 3.1.0', '< 4.0']

  s.add_runtime_dependency('docopt', '~> 0.6') # for argument parsing
  s.add_runtime_dependency('paint', '~> 2.3') # for colorized output
end
