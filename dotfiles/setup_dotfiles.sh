#!/bin/bash

shopt -s globstar nullglob
for dotfile in ~/stuff/dotfiles/.*; do
    file=$(basename "$dotfile")

    ln -sf ~/stuff/dotfiles/"$file" ~/"$file"
done

