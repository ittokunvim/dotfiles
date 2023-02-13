return {
  "glepnir/lspsaga.nvim",
  event = "BufRead",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>sf", "<cmd>Lspsaga lsp_finder<cr>",           desc = "Lspsaga finder" },
    { "<leader>sh", "<cmd>Lspsaga hover_doc<cr>",            desc = "Lspsaga doc" },
    { "<leader>sr", "<cmd>Lspsaga rename<cr>",               desc = "Lspsaga rename" },
    { "<leader>sn", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Lspsaga diagnostic" },
    { "<leader>st", "<cmd>Lspsaga term_toggle<cr>",          desc = "Lspsaga terminal" },
  },
  config = function()
    require("lspsaga").setup({})
  end
}
