# Publishing

Change version in `lib/pass_station/version.rb`.

Be sure all tests pass!

```bash
bundle exec rake test
```

Ensure there is no linting offence.

```bash
bundle exec rubocop
```

Check if new upstream data is available.

```bash
pass-station update --check
```

If so, update data:

```bash
pass-station update --force data/
```

And reflect the integrity hash in `PassStation::DB::UPSTREAM_DATABASE` in `lib/pass_station/source.rb`.

```bash
sha256sum data/*.csv
```

Don't forget to rebuild the library documentation to reflect, new code, new version, etc.:

```bash
bundle exec yard doc
```

```bash
git tag -a vx.x.x
git push --follow-tags

bundle exec rake build
gem push pkg/pass-station-x.x.x.gem
```

See https://guides.rubygems.org/publishing/.
