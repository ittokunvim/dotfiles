return {
  {
    "saghen/blink.cmp",
    -- 遅延読み込み
    event = { "InsertEnter", "CmdLineEnter" },
    -- optional: provides snippets for the snippet source
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
    },
    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source with:
    -- build = 'nix run .#build-plugin',

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
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = "enter" },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = { auto_show = true },
        -- Display a preview of the selected item on the current line
        ghost_text = { enabled = true },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },

      -- キーマップにluasnipを使用する
      snippets = { preset = "luasnip" },
    },
    opts_extend = { "sources.default" }
  },
  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = function()
      local snip = require("luasnip")

      return {
        {
          "<tab>",
          function() return snip.jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>" end,
          expr = true,
          silent = true,
          mode = "i",
        },
        { "<tab>", function() snip.jump(1) end, mode = "s", },
        { "<s-tab>", function() snip.jump(-1) end, mode = { "i", "s" }, },
      }
    end,
  },
  -- built-in LSP plugin
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { ";sf", "<cmd>Lspsaga lsp_finder<cr>",           desc = "Lspsaga finder" },
      { ";sh", "<cmd>Lspsaga hover_doc<cr>",            desc = "Lspsaga doc" },
      { ";sr", "<cmd>Lspsaga rename<cr>",               desc = "Lspsaga rename" },
      { ";sa", "<cmd>Lspsaga code_action<cr>",          desc = "Lspsaga code action" },
      { ";s[", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Lspsaga diagnostic prev" },
      { ";s]", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Lspsaga diagnostic next" },
      { ";st", "<cmd>Lspsaga term_toggle<cr>",          desc = "Lspsaga terminal" },
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
  -- Auto Pair plugin
  {
    "windwp/nvim-autopairs",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },
  -- autoclose and autorename html tag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- Auto Close (if, do, def, endif)
  "tpope/vim-endwise",
  -- Change and Add Surroundings in Pairs
  "tpope/vim-surround",
  -- Comment Out
  "tpope/vim-commentary",
  -- Lua
  {
    "folke/zen-mode.nvim",
    keys = {
      { ";z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
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
}
