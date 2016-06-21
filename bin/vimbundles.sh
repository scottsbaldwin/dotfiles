#!/usr/bin/env bash

BASE="$HOME/.vimbundles"

mkdir -p $BASE

default_bundles=("${HOME}/.vimbundle" "${HOME}/.vimbundle.local")
project_bundles=($(find $WELLMATCH_DIR -name "*.vimbundle"))

declare -a found_plugins=()
declare -a unique_plugins=()

install_plugin() {
  cd $BASE
  dir="$(basename $1)"
  echo
  if [ -d "$BASE/$dir" ]; then
    echo "Updating $1"
    cd "$BASE/$dir"
    git pull --rebase
  else
    echo "Installing $1"
    git clone https://github.com/"$1".git
  fi
}

DIR=$(pwd)
cd $HOME
vim -c 'call pathogen#helptags()|q'
cd $DIR

merged_vimbundle_files=("${default_bundles[@]}" "${project_bundles[@]}")

for bundle in ${merged_vimbundle_files[@]}; do
  project_plugins=$(cat $bundle)
  found_plugins=("${found_plugins[@]}" "${project_plugins[@]}")
done

unique_plugins=$(echo "${found_plugins[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' ')

for plugin in ${unique_plugins[@]}; do
  install_plugin $plugin
done
