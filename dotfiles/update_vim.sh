#!/bin/bash

cd ~/.vim/bundle
for d in */ ; do echo "----- $d -----" && cd $d && git pull --rebase && cd ..; done

