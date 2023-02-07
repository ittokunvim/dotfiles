# dotfiles

このリポジトリは、開発のための設定ファイルが置かれています。
以下の指示に従って環境をインストールしましょう。

## 準備：homebrewをインストールする

設定ファイルをインポートする前にまず、パッケージマネージャをインストールします。

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

上記のコマンドでうまく動作しなかったら、[homebrew](https://brew.sh/index_ja)にアクセスして、そこの指示に従ってインストールしましょう。

### ドットファイルを取得する

環境を構築するにはまずファイルが必要です。このリポジトリをダウンロードしましょう。

```shell
git clone https://github.com/ittokun/dotfiles.git
```

ダウンロードが終えたら、以下のファイルを自分のPCの環境に落としていきましょう。

- .config/
- .warp/themes
- .vimrc

次は、homebrewにパッケージをインストールしていきます。`.config/homebrew/`に移動して以下のコマンドを実行します。

```bash
brew bundle
```

うまくいけば、Brewfileに書かれたパッケージ群をインストールできているはずです。
あとは、インストールされたパッケージを使用するだけです。お疲れ様でした🤟
