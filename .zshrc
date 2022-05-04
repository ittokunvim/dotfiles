#  _________  _   _ ____   ____
# |__  / ___|| | | |  _ \ / ___|
#   / /\___ \| |_| | |_) | |
#  / /_ ___) |  _  |  _ <| |___
# /____|____/|_| |_|_| \_\\____|

# prompt
PROMPT="%F{green}%n %F{yellow}%m %F{blue}%c %F{white}%# "

# aliases
alias mizusirazu="cd $HOME/Documents/mizusirazu"
alias ..="cd .."
alias ...="cd ../../"
alias d='docker'
alias dc='docker-compose'
alias ls="ls -G"
alias grep="grep --color=auto"
alias rm="trash"
alias relog="exec $SHELL -l"
alias du-cd="du -sm ./* | sort -rn | head" 
alias ipecho="curl ifconfig.io"

# download wav from youtube.com
yt-dl-wav() { 
  youtube-dl -x --audio-format wav -o '%(title)s.%(ext)s' $1

  if [ $? -gt 0 ]; then
    echo 'usage: yt-dl-wav [YOUTUBE_URL]'
  fi
}

# make test image file
create_test_img() {
  dd if=/dev/urandom of=$2 count=$1 bs=1024

  if [ $? -gt 0 ]; then
    echo 'usage: create_test_img [NUMBER x 1024bytes] [PATH]'
  fi
}

# zsh_history
#
# HISTSIZE: maximum number of commands to cache
# SAVEHIST: maximum number of commands to be stored in history
#
# hist_ignore_all_dups: Delete the older of the duplicate commands
# hist_ignore_dups:     Do not save the same command as the previous command
# share_history:        Share history files
# append_history:       Add and save history
# inc_append_history:   add incrimental in history
# hist_no_store:        history command does not save history file
# hist_reduce_blanks:   fill the blanks and save

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

# homebrew
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

# # rbenv
# eval "$(rbenv init -)"

# # pyenv
# export PATH=$HOME/.pyenv/shims:$PATH
# eval "$(pyenv init -)"

# # fzf
# export PATH="$PATH:$HOME/.fzf/bin"
# export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
# export FZF_DEFAULT_OPTS='--height 30% --border'
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# # Postgresql
# export PGDATA=/opt/homebrew/var/postgres

# # n (node)
# export N_PREFIX=$HOME/.n
# export PATH=$N_PREFIX/bin:$PATH

# zsh-completions
#
# If there is a brew command, add it to the search.
#
# search options
# - case-sensitivity:                                    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# - Packed display of completion:                        setopt list_packed
# - load ${fg}, $reset_color etc...:                     autoload colors
# - colorized display for ls command completion as well: zstyle ':completion:*:default' list-colors ${LS_COLORS}
# - check spell:                                         setopt correct
#
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt list_packed
autoload colors
zstyle ':completion:*:default' list-colors ${LS_COLORS}
# check spell
setopt correct

# zplug
#

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

