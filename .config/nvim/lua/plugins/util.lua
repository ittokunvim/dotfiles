return {
  -- display startuptime
  {
    "dstein64/vim-startuptime",
    keys = { { ";sut", "<cmd>StartupTime<cr>", desc = "Vim StartUpTime" } },
  },
  -- editorconfig
  "editorconfig/editorconfig-vim",
  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    -- 動作しなければ、Vimコマンドで`:call mkdp#util#install()`を実行する
    build = function() vim.fn["mkdp#util#install"]() end,
    keys = { { ";mdp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" } },
  },
}
