return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope Grep" }
  },
  opts = {
    defaults = {
      layout_strategy = "vertical",
      layout_config = { height = 0.95 },
    },
  },
  config = function(plugin, opts)
    require("telescope").setup(opts)
  end
}
