#!/bin/sh
# dotfiles のシンボリックリンクを作成する
# 何度実行しても同じ結果になる。既存のファイルはバックアップしてから置き換える。
set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config"

# 以前の手順で ~/.config 全体をリンクしている場合は止める
if [ -L "$CONFIG_DIR" ]; then
  echo "error: $CONFIG_DIR がシンボリックリンクになっています。" >&2
  echo "       'rm $CONFIG_DIR' でリンクを外してから再実行してください。" >&2
  exit 1
fi
mkdir -p "$CONFIG_DIR"

link() {
  src="$DOTFILES_DIR/$1"
  dst="$HOME/$1"

  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    backup="$dst.backup.$(date +%Y%m%d%H%M%S)"
    mv "$dst" "$backup"
    echo "backup: $dst -> $backup"
  fi

  ln -s "$src" "$dst"
  echo "link:   $dst -> $src"
}

link .config/fish
link .config/nvim
link .config/starship.toml
link .vimrc
link .zshrc
link .zsh
