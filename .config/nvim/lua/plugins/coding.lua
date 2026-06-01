return {
  -- 補完プラグイン
  -- See :h blink-cmp-config-keymap for defining your own keymap
  {
    "saghen/blink.cmp",
    -- 遅延読み込み
    event = { "InsertEnter", "CmdLineEnter" },
    -- use a release tag to download pre-built binaries
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
      "windwp/nvim-autopairs",
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      keymap = { preset = "enter" },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = { auto_show = true },
        -- Display a preview of the selected item on the current line
        ghost_text = { enabled = true },
      },

      -- キーマップにluasnipを使用する
      snippets = { preset = "luasnip" },
    },
  },
  -- LSP用のUIプラグイン
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { ";sf", "<cmd>Lspsaga lsp_finder<cr>", desc = "Lspsaga finder" },
      { ";sh", "<cmd>Lspsaga hover_doc<cr>", desc = "Lspsaga doc" },
      { ";sr", "<cmd>Lspsaga rename<cr>", desc = "Lspsaga rename" },
      { ";sa", "<cmd>Lspsaga code_action<cr>", desc = "Lspsaga code action" },
      { ";s[", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Lspsaga diagnostic prev" },
      { ";s]", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Lspsaga diagnostic next" },
      { ";st", "<cmd>Lspsaga term_toggle<cr>", desc = "Lspsaga terminal" },
    },
    opts = {
      ui = {
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "single",
        winblend = 0,
        expand = "",
        collapse = "",
        code_action = "",
        incoming = " ",
        outgoing = " ",
        hover = " ",
        kind = {},
      },
    },
  },
  -- オートペアリングを行う
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },
  -- フルスクリーンでコーディングを行う
  {
    "folke/zen-mode.nvim",
    keys = {
      { ";z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- フルスクリーン中にコードをフォーカスする
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.25, -- amount of dimming
        -- we try to get the foreground from the highlight groups or fallback color
        color = { "Normal", "#ffffff" },
        term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
        inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
      },
      context = 10, -- amount of lines we will try to show around the current line
      treesitter = true, -- use treesitter when available for the filetype
      -- treesitter is used to automatically expand the visible text,
      -- but you can further control the types of nodes that should always be fully expanded
      expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
        "function",
        "method",
        "table",
        "if_statement",
      },
      exclude = {}, -- exclude these filetypes
    },
  },
  -- treesitterを使って、HTMLタグを自動的に閉じることができる
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
  -- 括弧を追加、編集、削除ができる
  -- See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  -- Neovimの標準コメント機能を強化する小さなプラグイン
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
}
