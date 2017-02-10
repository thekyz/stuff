# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export GOPATH=~/dev/go/
export EDITOR=vim
export WINEDITOR=$EDITOR
export EDITOR1=$EDITOR
export SRC_EDITOR=vim
export echo_dot=no
export STDENV2=yes
export SHELL=/bin/bash

if [ -e /usr/share/terminfo/x/xterm-256color  ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

if [ -e /ap/local/env/profiles/.profile.common ]; then
    . /ap/local/env/profiles/.profile.common
fi

#PATH="$HOME/.node/bin:$PATH"
#NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"
#MANPATH="$HOME/.node/share/man:$MANPATH"

PATH="/usr/local/heroku/bin:$PATH"
