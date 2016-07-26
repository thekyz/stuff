#!/bin/bash

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors ~/.vim/ftplugin/sh.vim

# Install pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Color schemes
cd ~/.vim/colors
if [ ! -f ~/.vim/colors/molokai.vim ]; then
    wget https://raw.githubusercontent.com/flazz/vim-colorschemes/master/colors/molokai.vim
fi

# And lets plugin !
cd ~/.vim/bundle
git clone --depth=1 https://github.com/scrooloose/syntastic.git
git clone --depth=1 https://github.com/vim-airline/vim-airline.git
git clone --depth=1 https://github.com/tpope/vim-dispatch.git
git clone --depth=1 https://github.com/wincent/ferret.git
git clone --depth=1 https://github.com/tpope/vim-surround.git

# Filetype plugins ...
git clone --depth=1 https://github.com/thekyz/vim-ftplugins.git ~/.vim/ftplugin
