if status is-interactive
	alias ...="cd ../../"
	alias c="clear"
	alias d='docker'
	alias dc='docker-compose'
	alias ls="ls -G"
	alias grep="grep --color=auto"
	alias rm="trash"
	alias relog="exec $SHELL -l"
	alias du-cd="du -sm ./* | sort -rn | head" 
	alias groipecho="curl ifconfig.io"
	alias priipecho="networksetup -getinfo Wi-Fi"
  alias lg="lazygit"
end
