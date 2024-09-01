if status is-interactive
    alias ls='ls --color'
    alias ll='ls -l --color'
    alias la='ls -a --color'
    alias rm='rm -f'
    alias df='df -Th'
    alias bc='bc -l'
    alias less='less -R'
    alias grep='grep --color'
    alias n='nnn; . $NNN_TMPFILE'
    alias tree='tree -d'
    alias emacs='emacs -nw'

    abbr sta 'git status'
    abbr add 'git add'
    abbr ci 'git commit -m'
    abbr push 'git push'
    abbr pull 'git pull'

    if test -e /sbin/apk
        alias pkg-up='doas apk update; doas apk upgrade'
        alias pkg-for='apk search'
        alias pkg-add='doas apk add'
        alias pkg-rm='doas apk del'
        alias pkg-of='apk info -L'
        alias pkg-ls='apk list -I | less'
        alias free='free -h'
    else if test -e /opt/homebrew/bin/brew
        alias pkg-up='brew update; brew upgrade'
        alias pkg-for='brew search'
        alias pkg-add='brew install'
        alias pkg-rm='brew rm'
        alias pkg-of='brew ls'
        alias pkg-ls='brew ls'
    else if test -e /usr/bin/apt
        alias pkg-up='doas apt update; doas apt upgrade'
        alias pkg-for='apt search --names-only'
        alias pkg-add='doas apt install'
        alias pkg-rm='doas apt remove --purge'
        alias pkg-of='/usr/bin/dpkg -L'
        alias pkg-ls='apt list --installed | less'
        alias free='free -h'
    end

    if test -e /sys/class/power_supply/axp20x-battery/capacity
        alias batt='cat /sys/class/power_supply/axp20x-battery/capacity'
    end

end # status is-interactive
