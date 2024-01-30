vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.fillchars = "eob: "

vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
vim.keymap.set("n", "<TAB>", "<NOP>", { noremap = true })
vim.keymap.set("t", "<TAB>", "<TAB>", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.g.mapleader = " "
