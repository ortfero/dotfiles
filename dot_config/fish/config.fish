set -x LC_CTYPE en_US.UTF-8
set -x EDITOR hx
set -x VISUAL hx
set -x PAGER less -R

set -x FT_LOCAL_ENV true

if test -z $UID
    set -x UID (id -u)
end

if test -e ~/bin
    fish_add_path -g ~/bin
end

if test -e ~/go/bin
    fish_add_path -g ~/go/bin
end

if test -e /opt/homebrew/bin/brew
    fish_add_path -g /opt/homebrew/bin
    set -x HOMEBREW_PREFIX /opt/homebrew
    set -x MANPATH /opt/homebrew/share/man
    set -x INFOMATH /opt/homebrew/share/info
end

if status is-interactive

    set fish_greeting

    alias ll 'ls -l --color'
    alias la 'ls -a --color'
    alias n 'nnn; . $NNN_TMPFILE'

    abbr rcp '/usr/bin/rclone copy --progress'
    abbr sta 'git status'
    abbr add 'git add'
    abbr ci 'git commit -m'
    abbr push 'git push origin'
    abbr pushu 'git push -u origin'
    abbr fetch 'git fetch'
    abbr pull 'git pull'
    abbr restore 'git restore .'
    abbr reset 'git reset --hard'
    abbr clean 'git clean -fd'
    abbr branch 'git branch'
    abbr co 'git checkout'

    function ls
        command ls --color $argv
    end

    function rm
        command rm -f $argv
    end

    function df
        command df -Th $argv
    end

    function bc
        command bc -l
    end

    function less
        command less -R $argv
    end

    function grep
        command grep --color $argv
    end

    function tree
        command tree -d $argv
    end

    function emacs
        command emacs -nw $argv
    end

    function merge
        git checkout master
        git pull
        git checkout $argv
        git merge master
    end

    function rebase
        git checkout master
        git pull
        git checkout $argv
        git rebase master
    end

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
end # status is-login
