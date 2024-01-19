return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			float_opts = {
				border = "curved",
				width = 100,
				height = 30,
			},
		})

		vim.keymap.set("n", "<leader>i", ":ToggleTerm direction=float<CR>")
		vim.keymap.set("n", "<leader>h", ":ToggleTerm direction=horizontal<CR>")
	end,
}
