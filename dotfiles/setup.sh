#/!bin/bash

su -c "apt-get install git python vim sudo"
export EDITOR=vim
su -c "visudo"

# uncomment if necessary
#export http_proxy=
#export https_proxy=$http_proxy

cd ~
git clone https://www.github.com/stuff

for i in $(find ~/stuff/dotfiles -maxdepth 1 -name ".*" -type f -printf "%P \n"); do
    if [ -e ~/$i ]; then
        mv ~/$i ~/$i.bkp
    fi

    ln -s $i ~/$i
done

source ~/.bashrc

