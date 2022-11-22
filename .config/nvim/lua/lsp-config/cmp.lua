local cmp = require('cmp')
local opts = {}

opts.snippet = {
	expand = function(args)
		vim.fn["vsnip#anonymous"](args.body)
	end,
}

opts.sources = {
	{ name = 'nvim_lsp' },
}

opts.mapping = cmp.mapping.preset.insert({
	['<C-p>'] = cmp.mapping.select_prev_item(),
	['<C-n>'] = cmp.mapping.select_next_item(),
	['<C-l>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>']  = cmp.mapping.confirm { select = true },
})

opts.experimental = {
	ghost_text = true,
}

cmp.setup(opts)
