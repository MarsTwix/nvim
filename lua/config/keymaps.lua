local opts = { noremap = true, silent = true }

local function with_desc(desc)
	return vim.tbl_extend("force", opts, { desc = desc })
end

vim.keymap.set("n", "K", vim.lsp.buf.hover, with_desc("LSP hover"))
vim.keymap.set("n", "gd", vim.lsp.buf.definition, with_desc("LSP definition"))
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, with_desc("LSP declaration"))
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, with_desc("LSP implementation"))
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, with_desc("LSP type definition"))
vim.keymap.set("n", "gr", vim.lsp.buf.references, with_desc("LSP references"))
vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, with_desc("LSP signature help"))
-- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
-- vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, with_desc("Rename symbol"))
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, with_desc("Code action"))
vim.keymap.set("n", "<leader>cf", function()
	vim.lsp.buf.format({ async = true })
end, with_desc("Format buffer"))

vim.keymap.set("n", "gl", vim.diagnostic.open_float, with_desc("Line diagnostics"))
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, with_desc("Prev diagnostic"))
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, with_desc("Next diagnostic"))
