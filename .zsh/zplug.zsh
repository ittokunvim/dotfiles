#  _________  _    _   _  ____
# |__  /  _ \| |  | | | |/ ___|
#   / /| |_) | |  | | | | |  _
#  / /_|  __/| |__| |_| | |_| |
# /____|_|   |_____\___/ \____|

export ZPLUG_HOME=$HOME/.zplug

# if .zplug/init.sh is not found
if [ ! -e $ZPLUG_HOME/init.zsh ]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

source $ZPLUG_HOME/init.zsh

# auto completion
zplug "zsh-users/zsh-autosuggestions"
# highlight
zplug "zsh-users/zsh-syntax-highlighting"

# check not install plugin
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
