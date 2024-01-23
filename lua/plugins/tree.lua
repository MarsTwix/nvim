return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		local tree = require("nvim-tree")

		tree.setup({
			view = {
				side = "right",
				number = true,
				relativenumber = true,
        adaptive_size = true,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = false,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", {})
	end,
}
