#!/usr/bin/env bats

load './common'
source "src/hooks"

@test "Should not inject configs if authtoken" {
    run ngrok-autoload-config authtoken "token"
    assert_success
    assert_line --index 0 -- "authtoken"
    assert_line --index 1 -- "token"
    refute_line -p -- "--config"
    refute_line -p -- "ngrok.yml"
}

@test "Should not inject configs if credits" {
    run ngrok-autoload-config credits
    assert_success
    assert_line --index 0 -- "credits"
    refute_line -p -- "--config"
    refute_line -p -- "ngrok.yml"
}

@test "Should not inject configs if update" {
    run ngrok-autoload-config update
    assert_success
    assert_line --index 0 -- "update"
    refute_line -p -- "--config"
    refute_line -p -- "ngrok.yml"
}

@test "Should not inject configs if version" {
    run ngrok-autoload-config version
    assert_success
    assert_line --index 0 -- "version"
    refute_line -p -- "--config"
    refute_line -p -- "ngrok.yml"
}

@test "Should not inject configs if help" {
    run ngrok-autoload-config help
    assert_success
    assert_line --index 0 -- "help"
    refute_line -p -- "--config"
    refute_line -p -- "ngrok.yml"
}

@test "Should not inject configs if -h" {
    run ngrok-autoload-config -h
    assert_success
    assert_line --index 0 -- "-h"
    refute_line -p -- "--config"
    refute_line -p -- "ngrok.yml"
}

@test "Should not inject configs if IGNORE_CONFIG and authtoken" {
    IGNORE_CONFIG=true run ngrok-autoload-config authtoken "token"
    assert_success
    assert_line --index 0 -- "authtoken"
    assert_line --index 1 -- "token"
    refute_line -p -- "--config"
    refute_line -p -- "ngrok.yml"
}

@test "Should not inject configs if IGNORE_CONFIG" {
    IGNORE_CONFIG=true run ngrok-autoload-config http 8000 demo
    assert_success
    assert_line --index 0 -- "http"
    assert_line --index 1 -- "8000"
    assert_line --index 2 -- "demo"
}

@test "Should inject configs between the subcommand and the options for others" {
    run ngrok-autoload-config http 8000 demo
    assert_success
    assert_line --index 0 -- "http"
    assert_line --index 1 -- "--config"
    assert_line --index 2 -- "$HOME/.ngrok2/ngrok.yml"
    assert_line --index 3 -- "--config"
    assert_line --index 4 -- "$WORKING_DIRECTORY_ROOT/a/ngrok.yml"
    assert_line --index 5 -- "--config"
    assert_line --index 6 -- "$WORKING_DIRECTORY_ROOT/a/b/c/d/ngrok.yml"
    assert_line --index 7 -- "8000"
    assert_line --index 8 -- "demo"
}
