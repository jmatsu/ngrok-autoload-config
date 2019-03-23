#!/usr/bin/env bats

load '../common'
source "src/hooks"

@test "Should show a global configuration and the current wd configuration" {
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
    assert_line -- "--config $HOME/.ngrok2/ngrok.yml --config $WORKING_DIRECTORY_ROOT/a/ngrok.yml --config $WORKING_DIRECTORY_ROOT/a/b/c/d/ngrok.yml"
}
