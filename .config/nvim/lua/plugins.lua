-- automatically packer install
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
	-- required
	use 'wbthomason/packer.nvim'
	-- not required
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'luochen1990/rainbow'
	-- tpope
	use 'tpope/vim-dispatch'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	-- fzf
	use { 'junegunn/fzf', run = ':fzf#install()', opt = true }
	use { 'junegunn/fzf.vim', run = ':noremap ;fzf :Files<CR>', requires = { 'junegunn/fzf' }, opt = true }
	-- colorscheme
	use { 'cocopon/iceberg.vim', run = ':colorscheme iceberg' }

	-- check packer
	if packer_bootstrap then
		require('packer').install()
	end
end)

