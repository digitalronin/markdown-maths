#!/bin/bash

# RUN THIS SCRIPT **INSIDE** THE DOCKER CONTAINER

# Convert all markdown files in a local directory tree to html, using mpx-cli

set -euo pipefail

SRC_DIR=src
HTML_DIR=html

main() {
  rm -rf $HTML_DIR

  for mdfile in $(find $SRC_DIR -name '*.md'); do
    local readonly dir=$(local_dir $mdfile)
    mkdir -p $dir
    npx mpx convert $mdfile foo.html
    mv foo.html $(target_file $mdfile)
  done
}

local_dir() {
  local readonly filepath=$1
  echo $(dirname $(echo $filepath | sed "s/${SRC_DIR}/${HTML_DIR}/"))
}

target_file() {
  local readonly filepath=$1
  echo $filepath | sed "s/${SRC_DIR}/${HTML_DIR}/" | sed 's/\.md$/.html/'
}

main
