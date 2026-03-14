return {
  "mopp/vim-operator-convert-case",
  dependencies = {
    "kana/vim-operator-user",
    "tpope/vim-repeat",
  },
  keys = {
    { "<Leader>cl", mode = "n", "<Plug>(operator-convert-case-lower-camel)" },
    { "<Leader>cu", mode = "n", "<Plug>(operator-convert-case-upper-camel)" },
    { "<Leader>sl", mode = "n", "<Plug>(operator-convert-case-lower-snake)" },
    { "<Leader>su", mode = "n", "<Plug>(operator-convert-case-upper-snake)" },
    { "<Leader>tt", mode = "n", "<Plug>(operator-convert-case-toggle-upper-lower)" },
    { "<Leader>ll", mode = "n", "<Plug>(convert-case-loop)" },
    { "<Leader>cc", mode = "n", "<Plug>(operator-convert-case-convert)" },
 }
}
