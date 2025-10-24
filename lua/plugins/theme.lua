return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false, -- Colorschemes should load early
	config = function()
		require("catppuccin").setup({})
		vim.cmd.colorscheme("catppuccin")
	end,
}
