local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local mason_config = require('mason-lspconfig')

mason_config.setup {
	ensure_installed = {
		'sumneko_lua',
		'tsserver',
		'cssls',
	},
}

local on_attach = function(client, bufnr)
	local buf_map = function (lhs, rhs)
		vim.keymap.set('n', lhs, rhs, { buffer = bufnr })
	end

	buf_map("K", "<Cmd>Lspsaga hover_doc<CR>")
	buf_map("[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
	buf_map("]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>")
	buf_map("<leader>n", "<Cmd>Lspsaga rename<CR>")
	buf_map("<leader>a", "<Cmd>Lspsaga code_action<CR>")

	vim.api.nvim_create_user_command("Format", function()
		vim.lsp.buf.format() 
	end, {})
buf_map("<leader>F", "<Cmd>Format<CR>")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
local opts = { on_attach = on_attach, capabilities = capabilities }

mason_config.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup(opts)
	end,
	['sumneko_lua'] = function ()
		local lua_opts = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
				},
			},
			on_attach = on_attach,
			capabilities = capabilities,
		}
		lspconfig.sumneko_lua.setup(lua_opts)
	end,
})
