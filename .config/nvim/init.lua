-- load vimrc
vim.cmd([[
	so ~/.vimrc
]])

require('packer-config')
require('packer-config.keymap')
require('packer-config.colorscheme')

require('fern-config')
require('lualine-config')
require('lsp-config')
require('lsp-config.mason')
require('lsp-config.cmp')

