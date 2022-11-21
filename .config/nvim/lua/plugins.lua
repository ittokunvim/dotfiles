-- See https://github.com/wbthomason/packer.nvim
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'luochen1990/rainbow'
	use 'editorconfig/editorconfig-vim'
	use 'morhetz/gruvbox'
	use 'sheerun/vim-polyglot'
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
	-- statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- fern
	vim.cmd([[
		let g:fern#renderer = 'nerdfont'
		augroup my-glyph-palette
			autocmd! *
			autocmd FileType fern call glyph_palette#apply()
			autocmd FileType nerdtree,startify call glyph_palette#apply()
		augroup END
	]])

	-- gruvbox
	vim.cmd([[
		colorscheme gruvbox
	]])

	-- plugin keymap
	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap('n', ';fzf', '<cmd>Files<CR>', opts)
	vim.api.nvim_set_keymap('n', ';e', '<cmd>Fern . -drawer<CR>', opts)
end)

