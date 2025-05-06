local map = vim.keymap.set

map("i", "jj", "<ESC>", { noremap = true })
map('n', '<leader>e', vim.diagnostic.open_float)
