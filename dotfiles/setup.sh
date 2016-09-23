#/!bin/bash

# uncomment if necessary
#export http_proxy=
#export https_proxy=$http_proxy

su -c "apt-get install sudo"
export EDITOR=vi
su -c "visudo"

sudo apt-get remove vim-tiny -y
sudo apt-get update -y
sudo apt-get install vim git python vim-gnome python-pip curl silversearcher-ag shellcheck -y

cd ~
git clone https://www.github.com/stuff

shopt -s globstar nullglob
for dotfile in ~/stuff/dotfiles/.*; do
    if [ -e ~/"$dotfile" ]; then
        mv ~/"$dotfile" ~/"$dotfile".bkp
    fi

    ln -s ~/stuff/dotfiles/"$dotfile" ~/"$dotfile"
done

source ~/.bashrc

source vim_setup.sh

