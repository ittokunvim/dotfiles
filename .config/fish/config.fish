# PATH
fish_add_path --path \
    /opt/homebrew/bin \
    /opt/homebrew/sbin \
    /opt/homebrew/opt/ruby/bin \
    /opt/homebrew/opt/curl/bin \
    ~/.cargo/bin \
    /opt/homebrew/opt/libpq/bin \
    /opt/homebrew/opt/trash-cli/bin

# Commands
if status is-interactive
	alias ...="cd ../../"
	alias c="clear"
	alias d="docker"
	alias dc="docker-compose"
	alias lg="lazygit"

	alias bat="bat --theme=base16"
	alias grep="rg"
	alias ls="lsd"
	alias rm="trash"

	alias relog="exec $SHELL -l"
	alias echo-filesize="du -sm"
	alias echo-ip-gro="curl ifconfig.io"
	alias echo-ip-pri="networksetup -getinfo Wi-Fi"
end

# Theme
fish_config theme choose nord
