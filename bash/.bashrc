alias ls='ls --color=auto'
alias l='ls -alh'
alias vn="nvim"
alias vim="nvim"
alias remove="shred -zu"
alias compile_c="gcc $1 -o main -Wall -Wextra -Wpedantic"
alias compile_cc="g++ $1 -o main -Wall -Wextra -Wpedantic"

alias cfd="nvim $HOME/.config/dwm/config.def.h"
alias cfs="nvim $HOME/.config/st/config.def.h"
alias cfn="nvim $HOME/.config/nvim/init.vim"
alias cfc="nvim $HOME/.config/sxhkd/sxhkdrc"
alias cfb="nvim $HOME/.config/bspw/bspwmrc"
alias cfq="nvim $HOME/.config/qtile/config.py"
alias cfp="nvim $HOME/.config/polybar/config.ini"

export PS1="\[\e[0;37m\]\u\[\e[0m\]@\[\e[0;37m\]\h \[\e[32;1m\]\w\n\[\e[39m\]\[\e[32;1m\]❯ \[\e[0m\]"
export EDITOR="nvim"
export BROWSER="qutebrowser"
export PATH="/home/sudurra/.local/bin/:/home/sudurra/.local/share/build/lua-language-server/bin/:/usr/bin/:/bin/:/usr/sbin:/usr/local/bin:/usr/local/sbin"

alias exanak='curl wttr.in/hrazdan'
alias gp='xclip -sel c < ~/.local/share/git/git'
alias cheat='curl cheat.sh'
alias luamake=/home/sudurra/.local/share/build/lua-language-server/3rd/luamake/luamake
. "$HOME/.cargo/env"
