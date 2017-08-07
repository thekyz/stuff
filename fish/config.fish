set -x http_proxy emea.nics.nxp.com:8080
set -x https_proxy emea.nics.nxp.com:8080
set fish_greeting ""

for file in ~/.config/fish/conf.d/*.fish
    source $file
end

# chips
if [ -e ~/.config/chips/build.fish ] ; . ~/.config/chips/build.fish ; end

set -x TERM xterm-256color
