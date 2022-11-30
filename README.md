# dotfiles

このリポジトリでは、開発のための設定ファイルが置かれています。以下の指示に従って自分自身の環境にインストールしてください。

### fetch dotfiles

環境を構築するにはまずファイルが必要です。このリポジトリをダウンロードしましょう。

```shell
git clone https://github.com/ittoku-ky73/dotfiles.git
```

### install zsh

次に、シェルの設定を行います。Zshを使用します。以下の手順でインストールしましょう。

> 以下の手順を踏む前に、以下のコマンドが必要になります。それぞれインストールしておきましょう。
>
> - zsh：https://wiki.archlinux.jp/index.php/Zsh
> - zplug：https://github.com/zplug/zplug
>
> - starship：https://starship.rs/

1. ホームディレクトリに移動してZshのシンボリックリンクを貼ります。

```shell
ln -s PATH/TO/dotfiles/.zshrc ~/ && ln -s PATH/TO/dotfiles/.zsh ~/
```

2. zshを読み込みます。

```shell
source .zshrc
```

### intall nvim

次にテキストエディタの設定を行います。では下記のURLにアクセスして、`nvim`をインストールしましょう。`ruby`は言語サーバーに使います。

> nvim: https://github.com/neovim/neovim/wiki/Installing-Neovim
> ruby: https://www.ruby-lang.org/ja/downloads/

`nvim`をインストールできたら、以下のコマンドを実行します。

```shell
nvim
```

次に、プラグインをインストールしていきます。

```shell
nvim
# vim command
:PackerInstall
```

これでOKのはず👏
