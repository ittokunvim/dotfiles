-- keymap
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', ';f', '<Cmd>Files<CR>', opts)
map('n', ';e', '<Cmd>Neotree<CR>', opts)
map('n', ';h', '<Cmd>BufferPrevious<CR>', opts)
map('n', ';l', '<Cmd>BufferNext<CR>', opts)
map('n', ';c', '<Cmd>BufferClose<CR>', opts)
-- colorscheme
vim.cmd('colorscheme tokyonight-night')

-- autopairs
require("nvim-autopairs").setup {}

-- lspsaga
require("lspsaga").setup {}

-- neodev
require("neodev").setup {}

-- babecue
-- require("barbecue").setup {
-- 	attach_navic = false
-- }

-- lualine
require("lualine").setup {
	options = {
		theme = 'tokyonight',
	}
}

-- neo-tree
require("neo-tree").setup {
	close_if_last_window = false,
	window = {
		width = 35,
	}
}

-- nvim-treesitter
require("nvim-treesitter.configs").setup {
	ensure_installed = { 'bash', 'c', 'css', 'html', 'javascript', 'json', 'lua', 'markdown', 'markdown_inline', 'ruby', 'rust', 'toml', 'tsx', 'typescript', 'vim' },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = { "python", "c" }
	}
}
