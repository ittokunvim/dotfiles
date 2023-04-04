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
        { "<tab>", function() return snip.jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>" end, expr = true, silent = true, mode = "i", },
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
      { "<leader>sf", "<cmd>Lspsaga lsp_finder<cr>",           desc = "Lspsaga finder" },
      { "<leader>sh", "<cmd>Lspsaga hover_doc<cr>",            desc = "Lspsaga doc" },
      { "<leader>sr", "<cmd>Lspsaga rename<cr>",               desc = "Lspsaga rename" },
      { "<leader>sa", "<cmd>Lspsaga code_action<cr>",          desc = "Lspsaga code action" },
      { "<leader>s[", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Lspsaga diagnostic prev" },
      { "<leader>s]", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Lspsaga diagnostic next" },
      { "<leader>st", "<cmd>Lspsaga term_toggle<cr>",          desc = "Lspsaga terminal" },
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
    config = function(plugin, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },

  -- autoclose and autorename html tag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },

  -- Auto Close (if, do, def, endif)
  "tpope/vim-endwise",

  -- Change and Add Surroundings in Pairs
  "tpope/vim-surround",

  -- Comment Out
  "tpope/vim-commentary",
}
