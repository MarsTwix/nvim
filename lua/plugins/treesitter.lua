return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	branch = "main",
	config = function()
		ts = require("nvim-treesitter")

		ts.setup({})
		ts.install({ "vim" })
	end,
}
