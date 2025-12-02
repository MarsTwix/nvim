return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	lazy = false, -- Colorschemes should load early
	config = function()
		require("gruvbox").setup({})
		vim.cmd.colorscheme("gruvbox")
	end,
}
