itamae-sandbox
==============

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)][license]

[license]: https://github.com/to4iki/EitherSwift/master/LICENSE

## Description

use(play) [itamae-kitchen/itamae](https://github.com/itamae-kitchen/itamae)

## Usage

### Installation
```bash
$ git clone git@github.com:to4iki/itamae-sandbox.git
$ bundle
```

### Execute
```bash
# --log-level=debug
$ bundle exec itamae ssh --vagrant -j nodes/node.json recipes/ruby_build.rb
```

### spec
see also: [Serverspec で rbenv と Ruby のインストールをテスト | EasyRamble](http://easyramble.com/serverspec-for-rbenv-ruby.html)
```bash
$ bundle exec rake spec
```

## Licence

[MIT](https://github.com/to4iki/itamae-sandbox/master/LICENSE)

## Author

[to4iki](https://github.com/to4iki)
