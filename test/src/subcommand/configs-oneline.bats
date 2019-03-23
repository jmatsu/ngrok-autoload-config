#!/usr/bin/env bats

load '../common'
source "src/hooks"

@test "Should show a global configuration and the current wd configuration" {
    run ngrok-autoload-config configs-oneline
    assert_line -- "--config $HOME/.ngrok2/ngrok.yml --config $WORKING_DIRECTORY_ROOT/a/ngrok.yml --config $WORKING_DIRECTORY_ROOT/a/b/c/d/ngrok.yml"
}

@test "Should filter a global configuration based on USE_GLOBAL_CONFIG" {
    USE_GLOBAL_CONFIG=false run ngrok-autoload-config configs-oneline
    assert_line -- "--config $WORKING_DIRECTORY_ROOT/a/ngrok.yml --config $WORKING_DIRECTORY_ROOT/a/b/c/d/ngrok.yml"
}
