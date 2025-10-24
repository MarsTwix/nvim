return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("noice").setup({})

		require("telescope").load_extension("notify")
		vim.keymap.set("n", "<leader>fn", "<cmd>Telescope notify<CR>", { desc = "Notify history" })
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup({
					background_colour = "#000000",
				})
			end,
		},
		"nvim-treesitter/nvim-treesitter",
	},
}
