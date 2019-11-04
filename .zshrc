bindkey -v
bindkey '^R' history-incremental-search-backward

export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

export TTY='%F{magenta}%y%f'
export WHER='%F{yellow}%m%f'
export ERR='%(?..%F{red}%? %f)'
export PWD='%F{yellow}%1~%f'
export DATE='%F{blue}%*%f'
export PR='%B%F{white}%#%f%b'
export PROMPT="${TTY} ${WHER} ${ERR}$PWD $PR "
export RPROMPT="${DATE}"

alias ls="colorls -G"
export TERM=st-256color

export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

export PAGER="most"

alias e=vim
alias vi=vim
alias v=vim

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# This must be at the end oh .zshrc
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
