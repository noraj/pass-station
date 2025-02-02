# Installation

## Production

### Install from rubygems.org

```bash
gem install pass-station
```

Gem: [pass-station](https://rubygems.org/gems/pass-station)

### Install from BlackArch

From the repository:

```bash
pacman -S pass-station
```

PKGBUILD: [pass-station](https://github.com/BlackArch/blackarch/blob/master/packages/pass-station/PKGBUILD)

## Development

It's better to use [rbenv](https://github.com/rbenv/rbenv) or [asdf](https://github.com/asdf-vm/asdf) to have latests version of ruby and to avoid trashing your system ruby.

### Install from rubygems.org

```bash
gem install --development pass-station
```

### Build from git

Just replace `x.x.x` with the gem version you see after `gem build`.

```bash
git clone https://github.com/noraj/pass-station.git pass-station
cd pass-station
gem install bundler
bundler install
gem build pass-station.gemspec
gem install pass-station-x.x.x.gem
```

Note: if an automatic install is needed you can get the version with `$ gem build pass-station.gemspec | grep Version | cut -d' ' -f4`.

### Run without installing the gem

From local file:

```bash
irb -Ilib -rpass_station
```

Same for the CLI tool:

```bash
ruby -Ilib -rpass_station bin/pass-station
```

