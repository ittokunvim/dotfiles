# PATH
fish_add_path --path \
    /opt/homebrew/bin \
    /opt/homebrew/sbin \
    /opt/homebrew/opt/ruby/bin \
    /opt/homebrew/opt/curl/bin \
    ~/.cargo/bin \
    /opt/homebrew/opt/libpq/bin \
    /opt/homebrew/opt/trash-cli/bin

if status is-interactive
  # Abbreviations（入力時に展開される）
  abbr -a c clear
  abbr -a lg lazygit
  abbr -a ls lsd
  abbr -a rm trash
  abbr -a ls lsd
  abbr -a rm trash

  # Aliases
	alias ...="cd ../../"
  alias bat="bat --theme=base16"
	alias relog="exec $SHELL -l"
	alias echo-filesize="du -sm"
	alias echo-ip-gro="curl ifconfig.io"
	alias echo-ip-pri="networksetup -getinfo Wi-Fi"

  # Theme
  fish_config theme choose tokyonight_night
end


