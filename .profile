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
  if [[ ":$PATH:" != *":/opt/homebrew/sbin:"* ]]
  then 
    export PATH="/opt/homebrew/sbin:/opt/homebrew/bin:$PATH"
  fi
  export MANPATH=/opt/homebrew/share/man
  export INFOPATH=/opt/homebrew/share/info
fi

exec fish --login


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
