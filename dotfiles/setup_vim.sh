#!/bin/bash

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/colors
if [ ! -f ~/.vim/colors/molokai.vim ]; then
    wget https://raw.githubusercontent.com/flazz/vim-colorschemes/master/colors/molokai.vim
fi

cd ~/.vim/bundle
git clone --depth=1 https://github.com/scrooloose/syntastic.git
git clone --depth=1 https://github.com/vim-airline/vim-airline

