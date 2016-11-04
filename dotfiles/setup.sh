#!/bin/bash

on_arch=$(uname -r | grep ARCH)

if [ -z "$on_arch" ]; then
	su -c "apt-get install sudo"
	export EDITOR=vi
	su -c "visudo"

	sudo apt-get remove vim-tiny -y
	sudo apt-get update -y
	sudo apt-get install vim git python vim-gnome python-pip curl silversearcher-ag shellcheck -y
	sudo pip install pygments
else
	sudo -H -E pacman -Sy vim git python python-pip curl shellcheck wget base-devel

    # install yaourt
    devdir=~/dev
    mkdir "$devdir"

    cd "$devdir" || exit
    git clone https://aur.archlinux.org/package-query.git
    cd package-query || exit
    makepkg -si

    cd "$devdir" || exit
    git clone https://aur.archlinux.org/yaourt.git
    cd yaourt || exit
    makepkg -si

    # if this does not work add : Defaults env_keep += "http_proxy https_proxt ftp_proxy" to visudo
    sudo -H -E yaourt the_silver_searcher

	sudo -H -E pip install --upgrade pip
	sudo -H -E pip install pygments
fi

# shellcheck source=/dev/null
source ~/stuff/dotfiles/setup_dotfiles.sh
#source ~/.bashrc
# shellcheck source=/dev/null
source ~/stuff/dotfiles/setup_vim.sh

