export LC_CTYPE=en_US.UTF-8
export EDITOR=hx
export VISUAL=hx
export PAGER='less -R'
export NNN_TMPFILE=~/.config/nnn/.lastd

if [ -z $UID ]
then
  UID=$(id -u)
fi

if [ -d "$HOME/go/bin" ]
then
  PATH="$PATH:$HOME/go/bin"
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

