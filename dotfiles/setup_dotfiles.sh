#/!bin/bash

shopt -s globstar nullglob
for dotfile in ~/stuff/dotfiles/.*; do
    file=$(basename $dotfile)
    if [ -e ~/"$file" ]; then
        mv ~/"$file" ~/"$file".bkp
    fi

    ln -s ~/stuff/dotfiles/"$file" ~/"$file"
done

