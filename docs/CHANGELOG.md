## [Unreleased]

- Credentials:
  - Update database (new entries) to reflect upstream
- Fanciness:
  - Colored help message
  - Add examples and project links to help message
- Chore:
  - Add support for Ruby 3.2, 3.3, 3.4
  - **Breaking change**: Drop support for Ruby 2.6, 2.7, 3.0
  - Update dependencies

## [1.4.0]

- Credentials:
  - Update database (new entries) to reflect upstream
- Chore:
  - Update dependencies

## [1.3.0]

- Dependencies:
  - Update to yard [v0.9.27](https://github.com/lsegal/yard/releases/tag/v0.9.27)
    - Move from Redcarpet to CommonMarker markdown provider
    - Move doc syntax from Rdoc to markdown

- Chore:
  - Linting: cleaner code
  - Add support for Ruby 3.1

## [1.2.3]

Credentials:

- Added [many passwords](https://github.com/many-passwords/many-passwords) source [#14][#14]
- Code needed for multi-source handling
- Update database (new entries) to reflect upstream

Chore:

- Fork: repository move from [sec-it/pass-station](https://github.com/sec-it/pass-station) to [noraj/pass-station](https://github.com/noraj/pass-station)

[#14]:https://github.com/noraj/pass-station/issues/14

## [1.2.2]

- Update database (new entries) to reflect upstream
  - [db#11](https://github.com/ihebski/DefaultCreds-cheat-sheet/pull/11/files)
  - [db 62cb6d098a8886019f46ea17cffde3eb47d04103](https://github.com/ihebski/DefaultCreds-cheat-sheet/commit/62cb6d098a8886019f46ea17cffde3eb47d04103)
  - [db f1fbe1cd20dfcba55300c95b71936830483f38be](https://github.com/ihebski/DefaultCreds-cheat-sheet/commit/f1fbe1cd20dfcba55300c95b71936830483f38be)
  - [db#13](https://github.com/ihebski/DefaultCreds-cheat-sheet/pull/13/files)

## [1.2.1]

- fix error when empty search result
  - fix `output_search()` return value consistency

## [1.2.0]

- Fix database loading path issue [#1](https://github.com/sec-it/pass-station/issues/1)

## [1.1.0]

- **Feature**: add CSV, JSON, YAML formatting
- Project quality: add unit tests & CI
- Minor code and doc enhancements
- Gemfile: fix version compatibility (was wrongly advertised as compatible with Ruby 2.4 and 2.5 but is only with Ruby 2.6+ due to some options of the CSV parser)

## [1.0.0]

- First version
