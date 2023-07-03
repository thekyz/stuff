#!/bin/bash

set -euo pipefail

mkdir -p ~/.vim/pack/git-plugins/start ~/.vim/colors

# Color schemes
cd ~/.vim/colors || exit -1
if [ ! -f ~/.vim/colors/molokai.vim ]; then
    ln -sf ~/stuff/vim/molokai.vim .
fi

# And lets plugin !
cd ~/.vim/pack/git-plugins/start || exit -1
if [ -d "vim-airline" ]; then
    cd vim-airline
    git pull
    cd -
else
    git clone --depth=1 https://github.com/vim-airline/vim-airline.git
fi

if [ -d "nerdtree" ]; then
    cd nerdtree
    git pull
    cd -
else
    git clone --depth=1 https://github.com/scrooloose/nerdtree.git
fi

if [ -d "nerdcommenter" ]; then
    cd nerdcommenter
    git pull
    cd -
else
    git clone --depth=1 https://github.com/scrooloose/nerdcommenter.git
fi

if [ -d "ctrlp.vim" ]; then
    cd ctrlp.vim
    git pull
    cd -
else
    git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git
fi

if [ -d "vim-multiple-cursors" ]; then
    cd vim-multiple-cursors
    git pull
    cd -
else
    git clone --depth=1 https://github.com/terryma/vim-multiple-cursors.git
fi

if [ -d "ale" ]; then
    cd ale
    git pull
    cd -
else
    git clone --depth=1 https://github.com/w0rp/ale.git
fi

if [ -d "starlark.vim" ]; then
    cd starlark.vim
    git pull
    cd -
else
    git clone --depth=1 https://github.com/cappyzawa/starlark.vim.git
fi

# Filetype plugins ...
git clone --depth=1 https://github.com/thekyz/vim-ftplugins.git ~/.vim/ftplugin
