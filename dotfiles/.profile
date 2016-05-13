EDITOR=vim
WINEDITOR=$EDITOR
EDITOR1=$EDITOR
SRC_EDITOR=vim
echo_dot=no
STDENV2=yes
SHELL=/bin/bash

if [ -e /usr/share/terminfo/x/xterm-256color  ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

. /ap/local/env/profiles/.profile.common
