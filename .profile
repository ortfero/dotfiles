
export LC_CTYPE=en_US.UTF-8
export UID=$(id -u)

export EDITOR=nano
export PAGER='less -R'

if [ -e "/sys/class/power_supply/BAT1/capacity" ]
then
    read CAPACITY </sys/class/power_supply/BAT1/capacity
    export PS1='\A ${CAPACITY}% \[\033\[1;37m\]\w\[\033[0;39m\]\n \$ '
elif [ -e "/sys/class/power_supply/axp20x-battery/capacity" ]
then
    read CAPACITY </sys/class/power_supply/axp20x-battery/capacity
    export PS1='\A ${CAPACITY}% \[\033\[1;37m\]\w\[\033[0;39m\]\n \$ '
else
    export PS1='\A \[\033\[1;37m\]\w\[\033[0;39m\]\n \$ '
fi
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
