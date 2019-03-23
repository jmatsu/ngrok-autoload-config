#!/usr/bin/env bats

load 'lib/bats-support/load'
load 'lib/bats-assert/load'

# Don't import ngrok

@test "Should die unless ngrok exists" {
    run ngrok-autoload-config >/dev/null
    assert_failure
}
