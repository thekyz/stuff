#!/bin/bash

case $(uname) in
    "Linux")
        sudo -H -E pacman -Sy vim git python python-pip curl wget base-devel unzip

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
        yaourt -S the_silver_searcher
        yaourt -S i3-gaps-git

        sudo -H -E pip install --upgrade pip
        sudo -H -E pip install pygments

        mkdir ~/apps
        ;;
    "Darwin")
        xcode-select --install
        # install brew
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew doctor
        brew install caskroom/cask/brew-cask
        ;;
    *)
        echo "--- unsupported system ..." | exit 1
        ;;
esac

# shellcheck source=/dev/null
source ~/stuff/dotfiles/setup_dotfiles.sh
# shellcheck source=/dev/null
source ~/.bashrc
# shellcheck source=/dev/null
source ~/stuff/dotfiles/setup_vim.sh
