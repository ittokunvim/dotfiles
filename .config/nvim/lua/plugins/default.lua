return {
	-- "folke/neodev.nvim",
	-- "dstein64/vim-startuptime",
	-- "editorconfig/editorconfig-vim",
	-- "windwp/nvim-autopairs",
	-- "tpope/vim-endwise",
	-- { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- "tpope/vim-surround",
	-- "tpope/vim-commentary",
	-- "tpope/vim-fugitive",
	-- colorscheme
	-- "folke/tokyonight.nvim",
	-- tabline
	-- "nvim-tree/nvim-web-devicons",
	-- "romgrk/barbar.nvim",
	-- lsp
	-- "neovim/nvim-lspconfig",
	-- "hrsh7th/nvim-cmp",
	-- "hrsh7th/cmp-nvim-lsp",
	-- "hrsh7th/vim-vsnip",
	-- "williamboman/mason.nvim",
	-- "williamboman/mason-lspconfig",
	-- "L3MON4D3/LuaSnip",
	-- "saadparwaiz1/cmp_luasnip",
	-- "glepnir/lspsaga.nvim",
	-- markdown
	{ "iamcco/markdown-preview.nvim",    build = function() vim.fn["mkdp#util#install"]() end },
	-- lualine
	{ "nvim-lualine/lualine.nvim",       dependencies = "nvim-tree/nvim-web-devicons" },
	-- fzf
	{ "junegunn/fzf",                    build = ":call fzf#install()" },
	"junegunn/fzf.vim",
	-- filer
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		"MunifTanjim/nui.nvim",
	-- 	}
	-- },
	-- winbar
	{
		"utilyre/barbecue.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
