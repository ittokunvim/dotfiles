# dotfiles

このリポジトリは、開発のための設定ファイルが置かれています。
以下の指示に従って環境をインストールしましょう。

### homebrewをインストールする

設定ファイルをインポートする前にまず、パッケージマネージャをインストールします。

インストールするには[homebrew](https://brew.sh/index_ja)にアクセスして、その手順に従います。

### クローンする

環境を構築するにはまずファイルが必要です。このリポジトリをダウンロードしましょう。

```
git clone https://github.com/ittokunvim/dotfiles.git
cd dotfiles
```

### パッケージをインストールする

クローンできたら、以下のコマンドを実行してパッケージを一括インストールします。

```
brew bundle --file=.config/homebrew/Brewfile
```

### 設定ファイルを落とす

パッケージをインストールし終えたら、リポジトリの直下で以下のコマンドを実行してシンボリックリンクを貼ります。

```
./install.sh
```

`~/.config` 全体ではなく、次のファイルとフォルダを個別にリンクします。すでにファイルがある場合は `*.backup.日時` という名前で退避されます。

- `~/.config/fish`
- `~/.config/nvim`
- `~/.config/starship.toml`
- `~/.vimrc`
- `~/.zshrc`
- `~/.zsh`

> 以前の手順で `~/.config` をまるごとリンクしている場合は、`rm ~/.config` でリンクを外してから実行してください（末尾に `/` を付けないこと）。

### ログインシェルを fish にする

Homebrew の fish をログインシェルとして登録し、切り替えます。

```
echo "$(brew --prefix)/bin/fish" | sudo tee -a /etc/shells
chsh -s "$(brew --prefix)/bin/fish"
```

ターミナルを開き直すと fish が起動します。

### fish のプラグインを入れる

fish を起動して、`fish_plugins` に書かれたプラグインをインストールします。

```
fisher update
```

### iTerm2 のプロフィールを読み込む

1. iTerm2 の Settings > Profiles を開く
2. 左下の Other Actions... > Import JSON Profiles... を選ぶ
3. リポジトリの `iTerm2_Profiles.json` を選ぶ
4. 読み込んだプロフィールを選んで Other Actions... > Set as Default にする

### 確認する

ここまでうまくいけば、`fish, nvim`がうまいこと設定されているはずです。

- fish が起動し、Starship のプロンプトが表示される
- `nvim` を開くと設定が反映されている
- `ls -ld ~/.config` の先頭が `d`（シンボリックリンクではなく通常のフォルダ）になっている

設定されていれば成功です。お疲れ様でした🤙
