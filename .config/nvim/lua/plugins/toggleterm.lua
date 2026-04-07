-- toggle terminal
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function(plugin, opts)
    require("toggleterm").setup {
      open_mapping = [[<c-\>]]
    }
  end,
}
