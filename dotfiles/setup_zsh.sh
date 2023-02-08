#!/bin/bash

mkdir -p ~/utils
cd ~/utils || exit -1
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
