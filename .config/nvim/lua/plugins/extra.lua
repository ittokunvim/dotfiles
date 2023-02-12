return {
  -- display startuptime
  {
    "dstein64/vim-startuptime",
    keys = { { "<leader>sut", "<cmd>StartupTime<cr>", desc = "Vim StartUpTime" } }
  },

  -- editorconfig
  "editorconfig/editorconfig-vim",

  -- auto pair plugin
  {
    "windwp/nvim-autopairs",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(plugin, opts)
      require("nvim-autopairs").setup(opts)
    end
  },

  -- auto close (if, do, def, endif)
  "tpope/vim-endwise",

  -- change and add surroundings in pairs
	"tpope/vim-surround",

  -- comment out
  "tpope/vim-commentary",
}