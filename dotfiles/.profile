# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

if [ -e /etc/profile.d/proxy.sh ]; then
    ./etc/profile.d/proxy.sh
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
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

export TERM='xterm-256color'

if [ -e /ap/local/env/profiles/.profile.common ]; then
    . /ap/local/env/profiles/.profile.common
fi

#PATH="$HOME/.node/bin:$PATH"
#NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"
#MANPATH="$HOME/.node/share/man:$MANPATH"

PATH="/usr/local/heroku/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
