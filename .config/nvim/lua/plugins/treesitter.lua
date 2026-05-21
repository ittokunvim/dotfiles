return {
  -- 構文解析（パーサー）ジェネレーターおよびライブラリ
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "VeryLazy" },
    dependencies = { "windwp/nvim-ts-autotag" },
    build = ":TSUpdate",
    opts = {
      indent = { enable = true },
      highlight = { enable = true },
      folds = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
  },
  -- 自動でタグを閉じてくれる
  {
    "windwp/nvim-ts-autotag",
    event = { "BufNewFile", "BufReadPre" },
    opts = {},
  },
}
