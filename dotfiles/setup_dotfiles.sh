#!/bin/bash

shopt -s globstar nullglob
for dotfile in ~/dev/stuff/dotfiles/.*; do
    file=$(basename "$dotfile")

    ln -sf ~/dev/stuff/dotfiles/"$file" ~/"$file"
done

