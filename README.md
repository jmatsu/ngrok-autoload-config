# ngrok-autoload-config

`ngrok-autoload-config` is a proxy-based hook for `ngrok`.

You don't need to specify `ngrok` configuration files anymore.

## How it works

`ngrok-autoload-config` will find configurations recursively based on a directory structure.

If a working directory is `~/x/project/a/b/c`, then `ngrok-autoload-config` will use existing configurations in the following order.

```
~/.ngrok2/ngrok.yml # a global configuration
~/x/ngrok.yml
~/x/project/ngrok.yml
~/x/project/a/ngrok.yml
~/x/project/a/b/ngrok.yml
~/x/project/a/b/c/ngrok.yml # working directory configuration
```

Lower settings override the upper settings. So the strongest configuration is of the current working directory, and the weakest configuration will be the global configuration. This behavior relies on `ngrok`.

NOTE: `ngrok-autoload-config` won't load `~/ngrok.yml` because it's the same to a global configuration.

See [ngrok#config](https://ngrok.com/docs#config) to define configurations.

## Getting started

Recommend you clone this repository to enable `update-autoload` subcommand.

```
$ git clone -b release git@github.com:jmatsu/ngrok-autoload-config.git
# make sure use double quote
$ alias ngrok="$PWD/ngrok-autoload-config/ngrok-autoload-config" >> ~/.bashrc
```

Otherwise, just download `ngrok-autoload-config` and make an alias.

## Subcommands

**configs**

`ngrok-autoload-config configs` can show configurations to be loaded from the current working directory.

**configs-oneline**

Just make output of `configs` a single line.

**update-autoload**

This will update `ngrok-autoload-config` itself through `git`.

## Development

**Set up**

```
$ git submodule init
$ git submodule update
$ direnv allow
```

1. Edit `ngrok-autoload-config`
2. Add testcases if needed
3. Please make sure `bin/exec_all_bats.bash` and `shellcheck ngrok-autoload-config` work

If you have installed CircleCI CLI, you can run `circleci local execute --job jmatsu/bats-test` to execute `bin/exec_all_bats.bash`.

NOTE: `circleci local execute --job shellcheck/check` does not work because `git` is not installed on this image.
