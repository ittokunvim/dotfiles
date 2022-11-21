-- load vimrc
vim.cmd([[
	so ~/.vimrc
]])

require('plugins')

require('lualine').setup {}
