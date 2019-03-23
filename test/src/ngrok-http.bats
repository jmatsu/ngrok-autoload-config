#!/usr/bin/env bats

load '../lib/bats-support/load'
load '../lib/bats-assert/load'

@test "Should inject configs between the subcommand and the options" {
    run ngrok-autoload-config http 8000 2>/dev/null
    assert_success
    assert_line --index 0 -- http
    assert_line -- "--config $HOME/.ngrok2/ngrok.yml"
    assert_line -- "--config $PWD/ngrok.yml"
    assert_line --index 3 -- 8000
}
