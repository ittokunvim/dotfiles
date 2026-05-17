return {
  -- syntax highlight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight-moon")
    end,
  },
  {
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
        "ruby",
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
    },
  },
  -- Neovim's native comments
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  }
}
