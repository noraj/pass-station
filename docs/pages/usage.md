# Usage

## CLI

```plaintext
$ pass-station --help
Pass Station v1.2.2

Usage:
  pass-station list [--sort <col> --output <format>] [--source <id> --debug]
  pass-station search <term> [--field <col> --sort <col> --sensitive --output <format>] [--source <id> --no-color --debug]
  pass-station update ([--force] <path> | --check) [--debug]
  pass-station -h | --help
  pass-station --version

List options: list all default credentials

Output options: can be used with list and search commands
  -o <format>, --output <format>  Output format: JSON, CSV, YAML, table, pretty-table [default: pretty-table]
  -s <col>, --sort <col>          Sort by column (see documentation, columns depends on the database source)

Search options:
  --field <col>   Search in column: column name (see documentation, columns depends on the database source) or all
  --sensitive     Search is case sensitive (case insensitive by default)

Update options: update the password database (replace Pass Station DB with upstream DB, use with care)
  -f, --force   Bypass hash checking
  -c, --check   Check for possible update

Other options:
  --source <id> Credentials source database: 1 (Default Credentials Cheat Sheet), 2 (Many passwords) [default: 1]
  --no-color    Disable colorized output
  --debug       Display arguments
  -h, --help    Show this screen
  --version     Show version
```

## Library

```ruby
require 'pass_station'

ps = PassStation::DB.new
ps.parse
res = ps.search('weblogic',:productvendor)

# iterate
res.each do |item|
  product, username, password = item.to_h.values
end

# or get specific attribute of an entry
password = item[42][:password]
```

See the [library documentation](/yard/)

## Console

Launch `irb` with the library loaded.

```plaintext
$ pass-station_console
irb(main):001:0>
```
