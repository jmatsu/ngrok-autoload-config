# ngrok-autoload-config

`ngrok-autoload-config` is a proxy middleware for `ngrok`.

You don't need to specify `ngrok` configuration files anymore.

## How it works

`ngrok-autoload-config` will find configurations recursively based on a directory structure.

If a working directory is `~/x/project/a/b/c`, then `ngrok-autoload-config` will use configurations in the following order.

> ~/.ngrok2/ngrok.yml # a global configuration
> ~/x/ngrok.yml
> ~/x/project/ngrok.yml
> ~/x/project/a/ngrok.yml
> ~/x/project/a/b/ngrok.yml
> ~/x/project/a/b/c/ngrok.yml # working directory configuration

NOTE: `ngrok-autoload-config` won't load `~/ngrok.yml` because it's the same to a global configuration.

## Installation

Recommend you clone this repository to enable `update-autoload` subcommand.

```
$ git clone git@github.com:jmatsu/ngrok-autoload-config.git
$ # please create an alias whose name is 'ngrok' for 'ngrok-autoload-config'
$ alias ngrok="$$PWD/ngrok-autoload-config/ngrok-autoload-config" >> ~/.bashrc
```

Otherwise, just download `ngrok-autoload-config` and make an alias.

## Subcommands

**configs**

`ngrok-autoload-config configs` can show configurations to be loaded from the current working directory.

**configs-oneline**

Just make output of `configs` a single line.

**update-autoload**

Update `ngrok-autoload-config` itself through `git`.

## Development

```
$ git submodule init
$ git submodule update
$ direnv allow
```

**Run tests**

1. Edit `ngrok-autoload-config`
2. Run `bin/exec_all_bats.bash`
