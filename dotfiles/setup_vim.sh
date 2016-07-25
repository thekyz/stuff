#!/bin/bash

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p ~/.vim/colors
cd ~/.vim/colors
wget https://raw.githubusercontent.com/flazz/vim-colorschemes/master/colors/molokai.vim

