-- keymap
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', ';fzf', '<Cmd>Files<CR>', opts)
vim.api.nvim_set_keymap('n', ';e', '<Cmd>Fern . -drawer<CR>', opts)

-- colorscheme
vim.cmd([[
	colorscheme gruvbox
]])

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

