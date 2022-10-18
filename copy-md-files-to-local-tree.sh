#!/bin/bash

# RUN THIS SCRIPT **OUTSIDE** THE DOCKER CONTAINER

# Given a directory path, copy all markdown files to a target directory tree
# below the current directory

set -euo pipefail

TGT_ROOT=source  # <-- the name `source` is used by makefile targets

main() {
  local readonly src_root=$1
  local readonly pattern=$(echo $src_root | sed 's/\//./g')
  for mdfile in $(find $src_root -name '*.md'); do
    local readonly dir=$(local_dir $mdfile)
    mkdir -p $dir
    local readonly base=$(target_basename $mdfile)
    cp $mdfile "$dir/$base"
    echo $mdfile
  done

  rewrite_links $TGT_ROOT
}

local_dir() {
  local readonly filepath=$1
  echo $(dirname $(local_path $filepath))
}

local_path() {
  local readonly filepath=$1
  echo "${TGT_ROOT}/$(echo $filepath | sed "s/${pattern}.//")"
}

target_basename() {
  local readonly filepath=$1
  local readonly temp=$(echo $filepath | sed 's/README.md/index.md/')
  echo $(basename $temp) | sed 's/\.md$/.mmd/'
}

# The source markdown files contain links to other markdown files. These need
# to be rewritten so that links to "xxx/README.md" point to "xxx/index.html"
rewrite_links() {
  local readonly dir=$1
  for file in $(find $dir -type f); do
    sed -i 's/README\.md)/index.html)/g' $file
  done
}

main $1
