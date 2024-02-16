return {
  -- display startuptime
  {
    "dstein64/vim-startuptime",
    keys = { { "<leader>sut", "<cmd>StartupTime<cr>", desc = "Vim StartUpTime" } },
  },
  -- editorconfig
  "editorconfig/editorconfig-vim",
  -- MarkDown Preview
  {
    "iamcco/markdown-preview.nvim",
    keys = {
      { "<leader>mdp", "<cmd>MarkdownPreview<cr>", desc = "MarkDown Preview" },
    },
    build = "cd app && npm install",
    ft = { "markdown" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
