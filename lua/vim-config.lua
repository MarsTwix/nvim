vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.bo.softtabstop = 2

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

vim.api.nvim_set_hl(0, "LineNr", { fg = "#D3D3D3" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFEE00" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })

vim.o.fillchars = "eob: "

vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
vim.keymap.set("t", "<TAB>", "<TAB>", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.api.nvim_set_keymap('v', 'C', '"*y<CR>', { noremap = true, silent = true })
