#!/usr/bin/env bash

set -eu
set -o pipefail

cd test

while read test_file; do
  $test_file
done < <(find src -type f -name "*.bats")
