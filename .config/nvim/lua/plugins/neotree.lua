return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>NeoTreeShowInSplitToggle<cr>", desc = "NeoTree" },
  },
  config = function()
    require("neo-tree").setup()
  end,
}
