set -x LC_CTYPE en_US.UTF-8
set -x EDITOR dte
set -x VISUAL dte
set -x PAGER less -R

if test -z $UID
  set -x UID (id -u)
end

if test -e ~/go/bin
  fish_add_path ~/go/bin
end

if test -e /opt/homebrew/bin/brew
  set -x HOMEBREW_PREFIX /opt/homebrew
  set -x MANPATH /opt/homebrew/share/man
  set -x INFOMATH /opt/homebrew/share/info
end

if status is-interactive
    alias ls '/bin/ls --color'
    alias ll '/bin/ls -l --color'
    alias la '/bin/ls -a --color'
    alias rm '/bin/rm -f'
    alias df '/bin/df -Th'
    alias bc '/usr/bin/bc -l'
    alias less '/usr/bin/less -R'
    alias grep '/bin/grep --color'
    alias n 'nnn; . $NNN_TMPFILE'

    function tree
      command tree -d
    end
    
    alias emacs '/usr/bin/emacs -nw'
    alias gitui 'eval (ssh-agent -c) && ssh-add ~/.ssh/id_ed25519 && /usr/bin/gitui'
    alias rcp '/usr/bin/rclone copy --progress'

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

    zoxide init fish | source

end # status is-interactive

if status is-login
    if test (tty) = /dev/tty1
        dbus-run-session -- sway
    end
end
