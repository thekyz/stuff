# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM=screen-256color

LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

alias ls='ls -G --color'
alias ll='ls -al'
alias rgf='rg --files | rg'
alias cherry='git fetch; git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done; git remote prune origin'
#alias vim='nvim'

alias wc1='cd ~/dev/wc1'
alias wc2='cd ~/dev/wc2'
alias wc3='cd ~/dev/wc3'
alias wc4='cd ~/dev/wc4'
alias wc5='cd ~/dev/wc5'

alias upvpn='sudo nmcli con up id wayve'
alias downvpn='sudo nmcli con down id wayve'

alias ccat='pygmentize -g -O style=monokai'

setopt inc_append_history
setopt histignorealldups
setopt share_history

source ~/utils/powerlevel10k/powerlevel10k.zsh-theme

export LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}
export PATH=~/.local/bin:~/.cargo/bin:${PATH}

HISTSIZE=999999
SAVEHIST=999999
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/utils/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/utils/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/utils/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down
if [ -e /home/thekyz/.nix-profile/etc/profile.d/nix.sh ]; then . /home/thekyz/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

autoload -Uz bashcompinit && bashcompinit
_fly_compl() {
	args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
	local IFS=$'\n'
	COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
	return 0
}
complete -F _fly_compl fly
