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
	alias du-cd="du -sm ./* | sort -rn | head" 
	alias echo-ip-gro="curl ifconfig.io"
	alias echo-ip-pri="networksetup -getinfo Wi-Fi"
end
