return {
  "echasnovski/mini.indentscope",
  opts = {
    draw = {
      delay = 100,
    },
    symbol = "│",
  },
  config = function(plugin, opts)
    require("mini.indentscope").setup(opts)
  end
}
