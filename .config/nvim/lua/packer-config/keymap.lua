local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', ';fzf', '<Cmd>Files<CR>', opts)
vim.api.nvim_set_keymap('n', ';e', '<Cmd>Fern . -drawer<CR>', opts)

