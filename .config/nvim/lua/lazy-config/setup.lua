-- keymap
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', ';fzf', '<Cmd>Files<CR>', opts)
map('n', ';e', '<Cmd>NeoTreeShowToggle<CR>', opts)
map('n', ';h', '<Cmd>BufferPrevious<CR>', opts)
map('n', ';l', '<Cmd>BufferNext<CR>', opts)
map('n', ';c', '<Cmd>BufferClose<CR>', opts)

-- colorscheme
vim.cmd('colorscheme tokyonight')

-- neo-tree
require("neo-tree").setup {
	close_if_last_window = false,
	window = {
		width = 35,
	}
}

-- autopairs
require("nvim-autopairs").setup {}

-- lualine
require("lualine").setup {
	options = {
		theme = 'tokyonight',
	}
}

-- nvim-treesitter
require("nvim-treesitter.configs").setup {
	ensure_installed = { 'c', 'html', 'javascript', 'json', 'lua', 'markdown', 'markdown_inline', 'ruby', 'rust', 'toml', 'vim' }
}

-- babecue
require("barbecue").setup {
	attach_navic = false,
}
