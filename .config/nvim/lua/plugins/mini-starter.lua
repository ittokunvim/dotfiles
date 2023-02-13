return {
  "echasnovski/mini.starter",
  version = false,
  opts = function()
    local logo = table.concat({
"III TTTTTT TTTTTT  OOO  K  K U   U N   N",
" I    TT     TT   O   O K K  U   U NN  N",
" I    TT     TT   O   O KK   U   U N N N",
" I    TT     TT   O   O K K  U   U N  NN",
"III   TT     TT    OOO  K  K  UUU  N   N",
    }, "\n")
    local new_section = function(name, action, section)
      return { name = name, action = action, section = section }
    end

    local config = {
      autoopen = true,
      header = logo,
      items = {
        new_section("Find file", "Telescope find_files", "Telescope"),
        new_section("Grep text", "Telescope live_grep",  "Telescope"),
        new_section("Lazy",      "Lazy",                 "Config"),
        new_section("Mason",     "Mason",                "Config"),
        new_section("init.lua",  "e $MYVIMRC",           "Config"),
        new_section("Quit",      "qa",                   "Builtin"),
      },
      footer = [[Plugin Keymaps

noremap                             | inoremap
  <leader>sut - StartupTime         | gc    - Comment
  <leader>mdp - MarkdownPreview     | <C-p> - LspCmp Select Prev
  <leader>s   - Lspsaga             | <C-n> - LspCmp Select Next
  <leader>e   - Neotree             | <C-l> - LspCmp Complete
  <leader>f   - Telescope           | <C-e> - LspCmp Abort
  <leader>b   - Bufferline (barbar) | <CR>  - LspCmp Confirm
                                      <tab> - LuaSnip
      ]],
    }
    return config
  end,
  config = function(plugin, opts)
    require("mini.starter").setup(opts)
  end,
}
