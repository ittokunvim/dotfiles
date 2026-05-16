return {
  -- File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    cmd = "Neotree",
    keys = {
      {
        ";e",
        function()
          require("neo-tree.command").execute({
            action = "show",
            toggle = true,
            position = "current",
          })
        end,
        desc = "NeoTree",
      },
    },
    ---@module "neo-tree"
    ---@type neotree.Config
    opts = {},
  },
  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    keys = {
      { ";ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Files" },
      { ";fg", "<cmd>Telescope live_grep<cr>",  desc = "Telescope Grep" },
    },
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = { height = 0.95 },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
    end,
  },
  -- Keymap Hint
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "" },
        change = { text = "~" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", ";gh", gs.preview_hunk, "Preview Hunk")
        map("n", ";gs", gs.stage_hunk, "Stage Hunk")
        map("n", ";gb", function() gs.blame_line({ full = true }) end, "Blame Line")
      end,
    },
  },
}
