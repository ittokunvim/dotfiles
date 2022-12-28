-- keymap
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', ';fzf', '<Cmd>Files<CR>', opts)
map('n', ';e', '<Cmd>Fern .<CR>', opts)
map('n', ';h', '<Cmd>BufferPrevious<CR>', opts)
map('n', ';l', '<Cmd>BufferNext<CR>', opts)
map('n', ';c', '<Cmd>BufferClose<CR>', opts)

-- colorscheme
vim.cmd('colorscheme material')

-- fern
vim.cmd([[
	let g:fern#renderer = 'nerdfont'
	augroup my-glyph-palette
		autocmd! *
		autocmd FileType fern call glyph_palette#apply()
		autocmd FileType nerdtree,startify call glyph_palette#apply()
	augroup END
]])

-- autopairs
require("nvim-autopairs").setup {}

-- lualine
require("lualine").setup {}
