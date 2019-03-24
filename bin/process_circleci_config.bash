#!/usr/bin/env bash

set -eu
set -o pipefail

readonly tempFile=$(mktemp -t tmp)

trap "rm $tempFile || :" ERR 1 2 3 15

circleci config process .circleci/v2.1-config.yml > "$tempFile"
circleci config validate "$tempFile"
mv "$tempFile" .circleci/config.yml
