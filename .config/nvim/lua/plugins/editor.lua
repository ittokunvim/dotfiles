return {
  -- ファイルエクスプローラー
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
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
  -- ファインダー
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    keys = {
      { ";ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
      { ";fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
      { ";fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
      { ";fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
    },
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = { height = 0.95 },
      },
    },
  },
  -- キーマップヒント
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        {
          mode = { "n", "x" },
          { ";b", group = "Tab" },
          { ";f", group = "Telescope" },
          { ";g", group = "Git" },
          { ";s", group = "Lspsaga" },
          { ";x", group = "Debug" },
        },
      },
    },
    keys = {
      {
        ";?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  -- 画面リサイズ
  {
    "simeji/winresizer",
    keys = {
      { ";w", "<cmd>WinResizerStartResize<cr>", desc = "WindowResize" },
    },
  },
}
