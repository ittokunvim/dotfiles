return {
  "williamboman/mason.nvim",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
  },
  cmd = "Mason",
  keys = {
    { "<leader>ms", "<cmd>Mason<cr>", desc = "Mason" }
  },
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
  },
  config = function(plugin, opts)
    local m = require("mason")
    local mp = require("mason-core.package")
    local mr = require("mason-registry")

    local null_sources = {}
    for _, tool in ipairs(opts.ensure_installed) do
      local p = mr.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end

    m.setup(opts)
  end,
}
