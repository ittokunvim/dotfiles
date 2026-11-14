brew_prefix=/opt/homebrew

# 重複したパスを登録しない
typeset -U path
path=($brew_prefix/bin $brew_prefix/sbin $brew_prefix/opt/ruby/bin $path)

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_all_dups hist_no_store hist_reduce_blanks share_history

# 補完
fpath=($brew_prefix/share/zsh-completions $fpath)
autoload -Uz compinit && compinit
# 小文字で入力しても大文字の候補にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt list_packed correct

# エイリアス
alias ..="cd .."
alias ...="cd ../../"
alias c="clear"
alias d="docker"
alias dc="docker compose"
alias ls="ls -G"
alias grep="grep --color=auto"
alias rm="trash"
alias relog="exec $SHELL -l"
alias du-cd="du -sm ./* | sort -rn | head"
alias groipecho="curl ifconfig.io"
alias priipecho="networksetup -getinfo Wi-Fi"

# 関数
create_test_img() {
  dd if=/dev/urandom of="$2" count="$1" bs=1024 ||
    echo 'usage: create_test_img [NUMBER x 1024bytes] [PATH]'
}

# プロンプト
eval "$(starship init zsh)"

# プラグイン（zsh-syntax-highlighting は最後に読み込む必要がある）
source $brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
