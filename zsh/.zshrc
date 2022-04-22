export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bureau"
source $ZSH/oh-my-zsh.sh

export PATH="/home/sudurra/.local/bin/:/home/sudurra/.local/bin/scripts/:/usr/bin/:/bin/:/usr/sbin:/usr/local/bin:/usr/local/sbin"
export TERMINAL="st"
export EDITOR="nvim"
#ungoogled
export BROWSER="chromium"

alias ls='ls --color=auto'
alias l='ls -alh'
alias gp='xclip -sel c < ~/.local/share/git/git'
alias vn="nvim"
alias vim="nvim"
alias remove="shred -zu"
alias compile_c="gcc $1 -o main -Wall -Wextra -Wpedantic"
alias compile_cc="g++ $1 -o main -Wall -Wextra -Wpedantic"

alias cfd="nvim $HOME/.config/dwm/config.def.h"
alias cfs="nvim $HOME/.config/st/config.def.h"
alias cfn="nvim $HOME/.config/nvim/init.lua"
alias cfc="nvim $HOME/.config/sxhkd/sxhkdrc"
alias cfb="nvim $HOME/.config/bspw/bspwmrc"
alias cfq="nvim $HOME/.config/qtile/config.py"
alias cfp="nvim $HOME/.config/polybar/config.ini"
. "$HOME/.cargo/env"
