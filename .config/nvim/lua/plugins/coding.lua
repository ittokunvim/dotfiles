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
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = {"i", "s" } },
    }
  },

  -- Auto Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = {
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      experimental = {
        ghost_text = true,
      },
    },
    config = function(plugin, opts)
      local cmp = require("cmp")

      opts.mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-l>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>']  = cmp.mapping.confirm { select = true },
      })

      opts.sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip" },
      })

      cmp.setup(opts)
    end
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
    { "<leader>sn", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Lspsaga diagnostic" },
    { "<leader>st", "<cmd>Lspsaga term_toggle<cr>",          desc = "Lspsaga terminal" },
  },
  config = function()
    require("lspsaga").setup({})
  end
},

  -- Auto Pair plugin
  {
    "windwp/nvim-autopairs",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(plugin, opts)
      require("nvim-autopairs").setup(opts)
    end
  },

  -- Auto Close (if, do, def, endif)
  "tpope/vim-endwise",

  -- Change and Add Surroundings in Pairs
  "tpope/vim-surround",

  -- Comment Out
  "tpope/vim-commentary",
}
