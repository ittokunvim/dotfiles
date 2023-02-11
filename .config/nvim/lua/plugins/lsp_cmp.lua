return  {
  "hrsh7th/nvim-cmp",
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
}

