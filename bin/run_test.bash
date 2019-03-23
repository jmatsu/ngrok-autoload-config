#!/usr/bin/env bash

set -eu
set -o pipefail

cd test

export PATH="$PWD/bin:$PATH"
export PATH="$PWD/lib/bats/bin:$PATH"
export PATH="$PWD/lib/bats/libexec/bats-core:$PATH"

while read test_file; do
  $test_file
done < <(find src -type f -name "*.bats")
