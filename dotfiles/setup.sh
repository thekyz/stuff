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

sudo pip install pygments

cd ~
git clone https://www.github.com/stuff

source setup_dotfiles.sh

source ~/.bashrc

source setup_vim.sh

