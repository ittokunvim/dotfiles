local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'editorconfig/editorconfig-vim'
	use 'windwp/nvim-autopairs'
	use 'mattn/emmet-vim'
	use 'tpope/vim-endwise'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-lualine/lualine.nvim'
	use {'iamcco/markdown-preview.nvim', run = function() vim.fn['mkdp#util#install']() end}
	-- colorscheme
	use 'folke/tokyonight.nvim'
	-- tabline
	use 'nvim-tree/nvim-web-devicons'
	use {'romgrk/barbar.nvim'}
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
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	if packer_bootstrap then
		require('packer').sync()
	end
end)

