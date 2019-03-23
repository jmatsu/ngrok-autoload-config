# ngrok-autoload-config

`ngrok-autoload-config` is a proxy middleware for `ngrok`.

You don't need to specify `ngrok` configuration files anymore.

## Installation

`ngrok-autoload-config`

Recommend you clone this repository to enable `update-autoload` subcommand.

```
$ git clone git@github.com:jmatsu/ngrok-autoload-config.git
$ # please create an alias whose name is 'ngrok' for 'ngrok-autoload-config'
$ alias ngrok="$$PWD/ngrok-autoload-config/ngrok-autoload-config" >> ~/.bashrc
```

## Development

```
$ git submodule init
$ git submodule update
$ direnv allow
```

**Run tests**

Please run `bin/run_test.bash`. If you do not want to use `direnv`, then please run the following commands.

```
$ PATH_add() { export PATH="$1:$PATH"; }
$ source .envrc
$ bin/run_test.bash
```
