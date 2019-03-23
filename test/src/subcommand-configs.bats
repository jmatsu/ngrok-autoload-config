#!/usr/bin/env bats

load '../lib/bats-support/load'
load '../lib/bats-assert/load'

@test "Should show a global configuration and the current wd configuration" {
    run ngrok-autoload-config configs
    assert_line -- "--config $HOME/.ngrok2/ngrok.yml"
    assert_line -- "--config $PWD/ngrok.yml"
}

@test "Should filter a global configuration based on USE_GLOBAL_CONFIG" {
    USE_GLOBAL_CONFIG=false run ngrok-autoload-config configs
    refute_line -p -- "$HOME/.ngrok2/ngrok.yml"
    assert_line -- "--config $PWD/ngrok.yml"
}

@test "Should show configurations based on CONFIG_DIRS" {
    CONFIG_DIRS="$PWD/fixture/subcommand-configs" run ngrok-autoload-config configs
    assert_line -- "--config $HOME/.ngrok2/ngrok.yml"
    refute_line -p -- "$PWD/ngrok.yml"
    assert_line -- "--config $PWD/fixture/subcommand-configs/ngrok.yml"
}

@test "Should filter a global configuration based on USE_GLOBAL_CONFIG even if CONFIG_DIRS is given" {
    USE_GLOBAL_CONFIG=false CONFIG_DIRS="$PWD/fixture/subcommand-configs" run ngrok-autoload-config configs
    refute_line -p -- "$HOME/.ngrok2/ngrok.yml"
    refute_line -p -- "$PWD/ngrok.yml"
    assert_line -- "--config $PWD/fixture/subcommand-configs/ngrok.yml"
}
