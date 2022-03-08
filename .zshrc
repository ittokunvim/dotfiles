#  _________  _   _ ____   ____
# |__  / ___|| | | |  _ \ / ___|
#   / /\___ \| |_| | |_) | |
#  / /_ ___) |  _  |  _ <| |___
# /____|____/|_| |_|_| \_\\____|
# ====================================================
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

# download mp3 from youtube.com
yt-dl-mp3() { 
  cd $HOME/Music/mp3
  youtube-dl -x --audio-format mp3 -o '%(title)s.%(ext)s' $1
}

# check docker image versions
docker-tags() {
  curl https://registry.hub.docker.com/v1/repositories/$1/tags | jq -r '.[].name'
}

# ====================================================
# zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
# no save dups command
setopt hist_ignore_all_dups
# no save command if start with white space
setopt hist_ignore_space
# Fillin the mergin and record
setopt hist_reduce_blanks
# Automatically expand history during completion
setopt hist_expand

# ====================================================
# packages

# brew
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

# rbenv
eval "$(rbenv init -)"

# pyenv
export PATH=$HOME/.pyenv/shims:$PATH
eval "$(pyenv init -)"

# fzf
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Postgresql
export PGDATA=/opt/homebrew/var/postgres

# n (node)
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

# ====================================================
# zsh-completions

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# ignore case for searching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# display packed completion
setopt list_packed
# display complete list 
autoload colors
zstyle ':completion:*' list-colors ''
# check spell
setopt correct

# ====================================================
# zplug
export ZPLUG_HOME=/opt/homebrew/opt/zplug
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
