return {
  -- File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>NeoTreeShowInSplitToggle<cr>", desc = "NeoTree" },
    },
    config = function()
      require("neo-tree").setup()
    end,
  },

  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope Grep" }
    },
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = { height = 0.95 },
      },
    },
    config = function(plugin, opts)
      require("telescope").setup(opts)
    end
  },

  -- Keymap Hint
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup({})
    end,
  },
}
