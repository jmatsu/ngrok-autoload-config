#!/usr/bin/env bats

load '../common'
source "src/hooks"

@test "Should show a global configuration and the current wd configuration [v3]" {
    NGROK_VERSION=3.8.0 run ngrok-autoload-config configs
    # this expects running on linux
    assert_line --index 0 -- "--config $HOME/.config/ngrok/ngrok.yml"
    assert_line --index 1 -- "--config $WORKING_DIRECTORY_ROOT/a/ngrok.yml"
    assert_line --index 2 -- "--config $WORKING_DIRECTORY_ROOT/a/b/c/d/ngrok.yml"
}

@test "Should filter a global configuration based on USE_GLOBAL_CONFIG [v3]" {
    NGROK_VERSION=3.8.0 USE_GLOBAL_CONFIG=false run ngrok-autoload-config configs
    # this expects running on linux
    refute_line -p -- "$HOME/.config/ngrok/ngrok.yml"
    assert_line --index 0 -- "--config $WORKING_DIRECTORY_ROOT/a/ngrok.yml"
    assert_line --index 1 -- "--config $WORKING_DIRECTORY_ROOT/a/b/c/d/ngrok.yml"
}

@test "Should show a global configuration and the current wd configuration [v2]" {
    NGROK_VERSION=2.2.0 run ngrok-autoload-config configs
    # this expects running on linux
    assert_line --index 0 -- "--config $HOME/.ngrok2/ngrok.yml"
    assert_line --index 1 -- "--config $WORKING_DIRECTORY_ROOT/a/ngrok.yml"
    assert_line --index 2 -- "--config $WORKING_DIRECTORY_ROOT/a/b/c/d/ngrok.yml"
}

@test "Should filter a global configuration based on USE_GLOBAL_CONFIG [v2]" {
    NGROK_VERSION=2.2.0 USE_GLOBAL_CONFIG=false run ngrok-autoload-config configs
    # this expects running on linux
    refute_line -p -- "$HOME/.ngrok2/ngrok.yml"
    assert_line --index 0 -- "--config $WORKING_DIRECTORY_ROOT/a/ngrok.yml"
    assert_line --index 1 -- "--config $WORKING_DIRECTORY_ROOT/a/b/c/d/ngrok.yml"
}
