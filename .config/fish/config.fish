if status is-interactive
    alias ls 'command ls --color'
    alias ll 'command ls -l --color'
    alias la 'command ls -a --color'
    alias rm 'command rm -f'
    alias df 'command df -Th'
    alias bc 'command bc -l'
    alias less 'command less -R'
    alias grep 'command grep --color'
    alias n 'nnn; . $NNN_TMPFILE'
    alias tree 'command tree -d'
    alias emacs 'command emacs -nw'
    alias gitui 'eval (ssh-agent -c) && ssh-add ~/.ssh/id_ed25519 && command gitui'
    alias rcp 'rclone copy --progress'

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

if status is-login
    if test (tty) = /dev/tty1
        dbus-run-session -- sway
    end
end
