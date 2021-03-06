#!/usr/bin/env bats

load '../common'
source "src/hooks"

@test "Should show a global configuration and the current wd configuration" {
    run ngrok-autoload-config configs
    assert_line --index 0 -- "--config $HOME/.ngrok2/ngrok.yml"
    assert_line --index 1 -- "--config $WORKING_DIRECTORY_ROOT/a/ngrok.yml"
    assert_line --index 2 -- "--config $WORKING_DIRECTORY_ROOT/a/b/c/d/ngrok.yml"
}

@test "Should filter a global configuration based on USE_GLOBAL_CONFIG" {
    USE_GLOBAL_CONFIG=false run ngrok-autoload-config configs
    refute_line -p -- "$HOME/.ngrok2/ngrok.yml"
    assert_line --index 0 -- "--config $WORKING_DIRECTORY_ROOT/a/ngrok.yml"
    assert_line --index 1 -- "--config $WORKING_DIRECTORY_ROOT/a/b/c/d/ngrok.yml"
}
