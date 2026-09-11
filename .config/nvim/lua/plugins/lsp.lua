return {
  -- LSP(Language Server Protocol)を使用する
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "saghen/blink.cmp",
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    opts = {
      autoformat = true,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = {
        cssls = {},
        jsonls = {},
        rust_analyzer = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        ts_ls = {},
      },
      setup = {},
    },
    config = function(_, opts)
      local servers = opts.servers
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local function setup(server, server_opts)
        local merged_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, server_opts or {})

        if opts.setup[server] then
          if opts.setup[server](server, merged_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, merged_opts) then
            return
          end
        end

        merged_opts.mason = nil
        vim.lsp.config(server, merged_opts)
        vim.lsp.enable(server)
      end

      local mlsp_available = require("mason-lspconfig").get_available_servers()
      local ensure_installed = {} ---@type string[]

      for server, server_opts in pairs(servers) do
        if server_opts then
          local server_options = server_opts == true and {} or server_opts
          setup(server, server_options)
          if server_options.mason ~= false and vim.tbl_contains(mlsp_available, server) then
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = ensure_installed,
      })
    end,
  },
  -- Cmdline tools and LSP servers
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },
  -- nvim-lspconfigとmason.nvimを結ぶプラグイン
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {},
    },
  },
}
