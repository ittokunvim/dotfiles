return {
  -- 構文解析（パーサー）ジェネレーターおよびライブラリ
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    dependencies = { "windwp/nvim-ts-autotag" },
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      local install_dir = vim.fn.stdpath("data") .. "/site"
      local ensure_installed = {
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
      }

      treesitter.setup({
        install_dir = install_dir,
      })
      treesitter.install(ensure_installed)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "bash",
          "c",
          "diff",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "lua",
          "markdown",
          "python",
          "query",
          "rust",
          "toml",
          "tsx",
          "typescript",
          "typescriptreact",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
        },
        callback = function()
          vim.treesitter.start()
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end,
      })
    end,
  },
  -- 自動でタグを閉じてくれる
  {
    "windwp/nvim-ts-autotag",
    event = { "BufNewFile", "BufReadPre" },
    opts = {},
  },
}
