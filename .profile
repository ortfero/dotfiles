
export LC_CTYPE=en_US.UTF-8
export UID=$(id -u)

export EDITOR=nano
export PAGER='less -R'
export PS1='\A \e[33m\e[97m\w\e[37m\n \$ '
export NNN_TMPFILE=~/.config/nnn/.lastd

alias ls='ls --color'
alias ll='ls -l --color'
alias la='ls -a --color'
alias rm='rm -f'
alias bc='busybox bc -l'
alias less='less -R'
alias grep='grep --color'
alias nnn='nnn; . $NNN_TMPFILE'
alias emacs='emacs -nw'
alias pkg-up='doas apk update; doas apk upgrade'
alias pkg-for='apk search'
alias pkg-add='doas apk add'
alias pkg-rm='doas apk del'
alias pkg-of='apk info'
alias pkg-ls='apk list -I'
