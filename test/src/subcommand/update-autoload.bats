#!/usr/bin/env bats

load '../common'
source "src/hooks"

@test "Should run a command sequence of git" {
    run ngrok-autoload-config update-autoload
    cat<<EOF | assert_output -
fetch
origin
release
merge
--ff
origin/release
Completed update-autoload successfully.
EOF
}
