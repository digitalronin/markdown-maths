#!/bin/bash

# RUN THIS SCRIPT **OUTSIDE** THE DOCKER CONTAINER

# Given a directory path, copy all markdown files to a target directory tree
# below the current directory

set -euo pipefail

TGT_ROOT=src  # <-- used by convert-local-md-files.sh

main() {
  local readonly src_root=$1
  local readonly pattern=$(echo $src_root | sed 's/\//./g')
  for mdfile in $(find $src_root -name '*.md'); do
    local readonly dir=$(local_dir $mdfile)
    mkdir -p $dir
    cp $mdfile $dir
    echo $mdfile
  done
}

local_dir() {
  local readonly filepath=$1
  echo $(dirname $(local_path $filepath))
}

local_path() {
  local readonly filepath=$1
  echo "${TGT_ROOT}/$(echo $filepath | sed "s/${pattern}.//")"
}

main $1
