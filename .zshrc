# パスの設定
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# 補完で大文字小文字どちらでもマッチする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完を詰めて表示
setopt list_packed
# 補完一覧をカラー表示
autoload colors
zstyle ':completion:*' list-colors ''
# スペルチェック
setopt correct

# エイリアスの設定
alias work="cd $HOME/Documents/mizusirazu.net"
alias rmhist="trash -f \.[a-z]*_history \.[a-z]*hst \.[a-z]*info"
alias ..="cd .."
alias ...="cd ../../"
alias c="clear"
alias ls="ls -G"
alias grep="grep --color=auto"
alias rm="trash"
alias relog="exec $SHELL -l"
alias dc="docker-compose"
alias du-cd="du -sm ./* | sort -rn | head" 
alias zshrc="nvim ~/.zshrc && source ~/.zshrc"
alias brewfile="cd ~/.config/homebrew"
alias t='tmux'

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


# zplug
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# 自動補完機能
zplug "zsh-users/zsh-autosuggestions"
# ハイライト機能
zplug "zsh-users/zsh-syntax-highlighting"

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=10000
# 同じコマンドを削除
setopt hist_ignore_all_dups
# スペースから始まるコマンドは削除
setopt hist_ignore_space
# 余白は詰めて記録
setopt hist_reduce_blanks
# 補完時にヒストリを自動的に展開
setopt hist_expand

