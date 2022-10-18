#!/bin/bash

set -euo pipefail

HTML_DIR=$1
REPO_NAME=$2

for file in $(find docs -type f); do
  sed -i 's@href="/#@href="/'"$REPO_NAME"'/index.html#@g' $file
done
