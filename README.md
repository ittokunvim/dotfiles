# dotfiles

このリポジトリは、開発のための設定ファイルが置かれています。
以下の指示に従って環境をインストールしましょう。

### homebrewをインストールする

設定ファイルをインポートする前にまず、パッケージマネージャをインストールします。

インストールするには[homebrew](https://brew.sh/index_ja)にアクセスして、その手順に従います。

### クローンする

環境を構築するにはまずファイルが必要です。このリポジトリをダウンロードしましょう。

```shell
git clone https://github.com/ittokun/dotfiles.git
cd dotfiles
```

### パッケージをインストールする

クローンできたら、以下のコマンドを実行してパッケージを一括インストールします。

```bash
cd .config/homebrew
brew bundle
```

### 設定ファイルを落とす

パッケージをインストールし終えたら、以下のコマンドを実行してシンボリックリンクを貼ります。

```bash
cd ~/
ln -s DOTFILES_PATH/.config/ ./.config
ln -s DOTFILES_PATH/.warp/ ./.warp
ln -s DOTFILES_PATH/.vimrc ./.vimrc
```

### 確認する

ここまでうまくいけば、`fish, nvim`がうまいこと設定されているはずです。

設定されていれば成功です。お疲れ様でした🤙
