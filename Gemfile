# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in .gemspec
gemspec

group :runtime, :cli do
  gem 'docopt', '~> 0.6' # for argument parsing
  gem 'paint', '~> 2.2' # for colorized ouput
end

group :development, :install do
  gem 'bundler', ['>= 2.1.0', '< 2.3']
end

group :development, :test do
  gem 'minitest', '~> 5.12'
  gem 'rake', '~> 13.0'
end

group :development, :lint do
  gem 'rubocop', '~> 1.22'
end

group :development, :docs do
  gem 'commonmarker', '~> 0.21' # for GMF support in YARD
  gem 'github-markup', '~> 4.0' # for GMF support in YARD
  gem 'redcarpet', '~> 3.5' # for GMF support in YARD
  gem 'webrick', '~> 1.7' # server support for YARD server command
  gem 'yard', '~> 0.9'
end
