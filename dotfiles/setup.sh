#/!bin/bash

su -c "apt-get install sudo"
export EDITOR=vi
su -c "visudo"

sudo apt-get remove vim-tiny
sudo apt-get update
sudo apt-get install vim git python vim-gnome python-pip

# uncomment if necessary
#export http_proxy=
#export https_proxy=$http_proxy

cd ~
git clone https://www.github.com/stuff

for i in $(find ~/stuff/dotfiles -maxdepth 1 -name ".*" -type f -printf "%P \n"); do
    if [ -e ~/$i ]; then
        mv ~/$i ~/$i.bkp
    fi

    ln -s ~/stuff/dotfiles/$i ~/$i
done

source ~/.bashrc

