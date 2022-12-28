-- load vimrc
vim.cmd('so ~/.vimrc')

require('packer-config')
require('packer-config.setup')

require('lsp-config')
require('lsp-config.mason')
require('lsp-config.cmp')
require('lsp-config.snippets')

