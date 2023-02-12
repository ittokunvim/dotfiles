return {
  "romgrk/barbar.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>bn", "<cmd>BufferNext<cr>", desc = "Tab Next" },
    { "<leader>bc", "<cmd>BufferClose<cr>", desc = "Tab Close" },
  },
  opts = {
    animation = true,
    auto_hide = true,
    tabpages = true,
    closable = true,
    clickable = true,
    highlight_inactive_file_icons = true,
    highlight_visible = true,
    icons = true,
    icon_custom_colors = true,
  },
  config = function(plugin, opts)
    require("bufferline").setup(opts)
  end
}
