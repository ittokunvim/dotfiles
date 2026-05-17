return {
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
  -- Auto Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")

      return {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-l>"] = cmp.mapping.complete({}),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }),
        experimental = {
          ghost_text = true,
        },
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
