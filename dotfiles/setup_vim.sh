#!/bin/bash

mkdir -p ~/.vim/pack/git-plugins/start ~/.vim/colors

# Color schemes
cd ~/.vim/colors || exit -1
if [ ! -f ~/.vim/colors/molokai.vim ]; then
    ln -s ~/dev/stuff/vim/molokai.vim .
fi

# And lets plugin !
cd ~/.vim/pack/git-plugins/start || exit -1
git clone --depth=1 https://github.com/vim-airline/vim-airline.git
git clone --depth=1 https://github.com/scrooloose/nerdtree.git
git clone --depth=1 https://github.com/scrooloose/nerdcommenter.git
git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git
git clone --depth=1 https://github.com/terryma/vim-multiple-cursors.git
git clone --depth=1 https://github.com/w0rp/ale.git

# Filetype plugins ...
git clone --depth=1 https://github.com/thekyz/vim-ftplugins.git ~/.vim/ftplugin
