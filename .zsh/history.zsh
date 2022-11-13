#  _   _ ___ ____ _____ ___  ______   __
# | | | |_ _/ ___|_   _/ _ \|  _ \ \ / /
# | |_| || |\___ \ | || | | | |_) \ V /
# |  _  || | ___) || || |_| |  _ < | |
# |_| |_|___|____/ |_| \___/|_| \_\|_|

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_no_store
setopt hist_reduce_blanks
