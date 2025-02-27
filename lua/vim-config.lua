vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.bo.softtabstop = 2
vim.g.markdown_recommended_style = 0

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

vim.api.nvim_set_hl(0, "LineNr", { fg = "#D3D3D3" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFEE00" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })

vim.o.fillchars = "eob: "

vim.filetype.add({
	extension = {
		jb = "ruby",
	},
})
