return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- vim.g.loaded_netrw = 1
		-- vim.g.loaded_netrwPlugin = 1

		local tree = require("nvim-tree")

		tree.setup({
			view = {
				side = "right",
				adaptive_size = true,
				number = true,
				relativenumber = true,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = false,
			},
			filters = {
				git_ignored = false,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			update_focused_file = {
				enable = true,
			},
		})

		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
	end,
}
