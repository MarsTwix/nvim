return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
		})
    vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = '#808080' })
	end,
}
