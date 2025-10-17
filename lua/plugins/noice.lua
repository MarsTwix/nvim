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
		"rcarriga/nvim-notify",
		"nvim-treesitter/nvim-treesitter",
	},
}
