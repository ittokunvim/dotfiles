# ====================================================
#  _________  _   _ ____   ____
# |__  / ___|| | | |  _ \ / ___|
#   / /\___ \| |_| | |_) | |
#  / /_ ___) |  _  |  _ <| |___
# /____|____/|_| |_|_| \_\\____|
# ====================================================
# brew path
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

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

# aliases
alias work="cd $HOME/Documents/mizusirazu.net"
alias rmhist="trash -f \.[a-z]*_history \.[a-z]*hst \.[a-z]*info"
alias ..="cd .."
alias ...="cd ../../"
alias c="clear"
alias t='tmux'
alias ls="ls -G"
alias grep="grep --color=auto"
alias rm="trash"
alias relog="exec $SHELL -l"
alias dc="docker-compose"
alias du-cd="du -sm ./* | sort -rn | head" 
alias zshrc="nvim ~/.zshrc && source ~/.zshrc"
alias brewfile="cd ~/.config/homebrew"

# function
yt-dl-mp3() { 
  cd $HOME/Music/mp3
  youtube-dl -x --audio-format mp3 -o '%(title)s.%(ext)s' $1
}

cut-mp3() {
  ffmpeg -i $1 -ss $2 $1
}

docker-tags() {
  curl https://registry.hub.docker.com/v1/repositories/$1/tags | jq -r '.[].name'
}

# use rbenv
eval "$(rbenv init -)"

# use nvm
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# use fzf
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zplug
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# auto completion
zplug "zsh-users/zsh-autosuggestions"
# highlight
zplug "zsh-users/zsh-syntax-highlighting"

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# number of histories stored in memory
export HISTSIZE=1000
# number of histories stored in histfile
export SAVEHIST=10000
# delete same command
setopt hist_ignore_all_dups
# delete command that start with white space
setopt hist_ignore_space
# Fillin the mergin and record
setopt hist_reduce_blanks
# Automatically expand history during completion
setopt hist_expand

