# プラグインは Homebrew でインストールする（Brewfile を参照）
if type brew &>/dev/null; then
  BREW_PREFIX=$(brew --prefix)

  # auto completion
  [[ -f $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
    source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

  # highlight（最後に読み込む必要がある）
  [[ -f $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] &&
    source $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
