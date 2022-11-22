return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'luochen1990/rainbow'
	use 'editorconfig/editorconfig-vim'
	use 'morhetz/gruvbox'
	use 'sheerun/vim-polyglot'
	use 'nvim-lualine/lualine.nvim'
	-- filer
	use 'lambdalisue/fern.vim'
	use 'lambdalisue/nerdfont.vim'
	use 'lambdalisue/fern-renderer-nerdfont.vim'
	use 'lambdalisue/glyph-palette.vim'
	-- tpope
	use 'tpope/vim-dispatch'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	-- fzf
	use { 'junegunn/fzf', run = ':call fzf#install()' }
	use 'junegunn/fzf.vim'
	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/vim-vsnip'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig'
end)

