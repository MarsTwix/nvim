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
			persist_mode = false,
		})

		vim.keymap.set({ "n", "t" }, "<C-i>", [[<C-\><C-n>:ToggleTerm direction=float<CR>]])
		vim.keymap.set({ "n", "t" }, "<C-h>", [[<C-\><C-n>:ToggleTerm direction=horizontal<CR>]])
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>:ToggleTerm<CR>]])
	end,
}
