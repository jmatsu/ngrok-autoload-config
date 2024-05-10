#!/usr/bin/env bash

set -eu
set -o pipefail

export PATH="$PWD:$PATH"

cd test

export PATH="$PWD/bin:$PWD/lib/bats/bin:$PATH"

which ngrok-autoload-config
which ngrok

while read test_file; do
  $test_file
done < <(find src -type f -name "*.bats")
