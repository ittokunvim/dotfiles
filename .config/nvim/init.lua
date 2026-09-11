vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = { tab = "▸-", trail = "-", nbsp = "+" }
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.virtualedit = "onemore"
vim.opt.wildmode = "list:longest"
vim.opt.wrapscan = true

vim.keymap.set("n", "j", "gj", { desc = "Move down by display line" })
vim.keymap.set("n", "k", "gk", { desc = "Move up by display line" })
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })
vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("n", "qq", "qq", { desc = "Start recording" })

vim.keymap.set("n", "<leader>w", "<cmd>update<CR>", { desc = "Write buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })
vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { desc = "File explorer" })
vim.keymap.set("n", "<leader>t", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>ss", function()
  vim.cmd("split")
  vim.cmd("wincmd j")
end, { desc = "Split below" })
vim.keymap.set("n", "<leader>sv", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
end, { desc = "Split right" })

vim.keymap.set("i", "<C-p>", "<Up>")
vim.keymap.set("i", "<C-n>", "<Down>")
vim.keymap.set("i", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-f>", "<Right>")
vim.keymap.set("i", "<C-a>", "<Home>")
vim.keymap.set("i", "<C-e>", "<End>")
vim.keymap.set("i", "<C-d>", "<Del>")
vim.keymap.set("i", "<C-h>", "<BS>")
vim.keymap.set("i", "<C-g><C-u>", "<Esc>gUiwgi")
vim.keymap.set("i", "<C-g><C-l>", "<Esc>guiwgi")
vim.keymap.set("i", "<C-g><C-k>", "<Esc>bgUlgi")

vim.keymap.set("n", "x", '"_x', { desc = "Delete without yanking" })
vim.keymap.set("n", "D", '"_D', { desc = "Delete to end without yanking" })
vim.keymap.set("x", "x", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("o", "x", "d")
vim.keymap.set({ "o", "x" }, "i<Space>", "iW")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("n", "<C-k>", function()
  vim.cmd(("move -%d"):format(vim.v.count1))
  vim.cmd("normal! =l")
end, { desc = "Move line up" })
vim.keymap.set("n", "<C-j>", function()
  vim.cmd(("move +%d"):format(vim.v.count1))
  vim.cmd("normal! =l")
end, { desc = "Move line down" })
vim.keymap.set("x", "<C-k>", ":move'<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("x", "<C-j>", ":move'>+1<CR>gv=gv", { desc = "Move selection down" })

vim.cmd("packadd matchit")
vim.cmd("syntax enable")

require("config.lazy")
