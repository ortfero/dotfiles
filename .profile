export LC_CTYPE=en_US.UTF-8
export EDITOR=nano
export VISUAL=nano
export PAGER='less -R'

if [ -z $UID ]
then
  UID=$(id -u)
fi

if [ -e '/opt/homebrew/bin/brew' ]
then
  . $(/opt/homebrew/bin/brew shellenv)
else
  alias free='free -h'
fi


build_prompt() {
  if [ -e '/sys/class/power_supply/BAT0/capacity' ]
  then
    read CAPACITY </sys/class/power_supply/BAT0/capacity
  elif [ -e '/sys/class/power_supply/BAT1/capacity' ]
  then
    read CAPACITY </sys/class/power_supply/BAT1/capacity
  elif [ -e '/sys/class/power_supply/axp20x-battery/capacity' ]
  then
    read CAPACITY </sys/class/power_supply/axp20x-battery/capacity
  fi
  if [ -n "$CAPACITY" ]
  then
    echo -n '\[\033[1;37m\]\A ${CAPACITY}% \w\[\033[0;39m\]\n \$ '
  else
    echo -n '\[\033[1;37m\]\A \w\[\033[0;39m\]\n \$ '
  fi
}

if [ -z "$ZSH_VERSION" ]
then
  export PS1="$(build_prompt)"
fi


export NNN_TMPFILE=~/.config/nnn/.lastd

alias ls='ls --color'
alias ll='ls -l --color'
alias la='ls -a --color'
alias rm='rm -f'
alias df='df -Th'
alias bc='bc -l'
alias less='less -R'
alias grep='grep --color'
alias nnn='nnn; . $NNN_TMPFILE'
alias emacs='emacs -nw'

alias sta='git status'
alias add='git add'
alias ci='git commit -m'
alias push='git push'
alias pull='git pull'

if [ -e '/usr/bin/apk' ]
then
    alias pkg-up='doas apk update; doas apk upgrade'
    alias pkg-for='apk search'
    alias pkg-add='doas apk add'
    alias pkg-rm='doas apk del'
    alias pkg-of='apk info -L'
    alias pkg-ls='apk list -I | less'
elif [ -e '/opt/homebrew/bin/brew' ]
then
    alias pkg-up='brew update; brew upgrade'
    alias pkg-for='brew search'
    alias pkg-add='brew install'
    alias pkg-rm='brew rm'
    alias pkg-of='brew ls'
    alias pkg-ls='brew ls'
elif [ -e '/usr/bin/apt' ]
then
    alias pkg-up='doas apt update; doas apt upgrade'
    alias pkg-for='apt search --names-only'
    alias pkg-add='doas apt install'
    alias pkg-rm='doas apt remove --purge'
    alias pkg-of='/usr/bin/dpkg -L'
    alias pkg-ls='apt list --installed | less'
fi
