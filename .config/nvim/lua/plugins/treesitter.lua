return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "bash",
      "fish",
      "javascript",
      "json",
      "markdown",
      "markdown_inline",
      "rust",
      "tsx",
      "typescript",
      "toml",
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    -- experimental feature
    indent = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
  },
  config = function(plugin, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
