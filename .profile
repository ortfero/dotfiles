export LC_CTYPE=en_US.UTF-8
export EDITOR=nano
export VISUAL=nano
export PAGER='less -R'
export NNN_TMPFILE=~/.config/nnn/.lastd

if [ -z $UID ]
then
  UID=$(id -u)
fi

if [ -e '/opt/homebrew/bin/brew' ]
then
  export HOMEBREW_PREFIX=/opt/homebrew
  export MANPATH=/opt/homebrew/share/man
  export INFOPATH=/opt/homebrew/share/info
fi

if [ -e '/opt/homebrew/bin/fish' ]
then
  exec /opt/homebrew/bin/fish --login
elif [ -e '/usr/bin/fish' ]
then
  exec /usr/bin/fish --login
elif [ -e '/data/data/com.termux/files/usr/bin/fish' ]
then
  exec /data/data/com.termux/files/usr/bin/fish --login
fi


#build_prompt() {
#  if [ -e '/sys/class/power_supply/BAT0/capacity' ]
#  then
#    read CAPACITY </sys/class/power_supply/BAT0/capacity
#  elif [ -e '/sys/class/power_supply/BAT1/capacity' ]
#  then
#    read CAPACITY </sys/class/power_supply/BAT1/capacity
#  elif [ -e '/sys/class/power_supply/axp20x-battery/capacity' ]
#  then
#    read CAPACITY </sys/class/power_supply/axp20x-battery/capacity
#  fi
#  if [ -n "$CAPACITY" ]
#  then
#    echo -n '\[\033[1;37m\]\A ${CAPACITY}% \w\[\033[0;39m\]\n \$ '
#  else
#    echo -n '\[\033[1;37m\]\A \w\[\033[0;39m\]\n \$ '
#  fi
#}

#if [ -z "$ZSH_VERSION" ]
#then
#  export PS1="$(build_prompt)"
#fi
