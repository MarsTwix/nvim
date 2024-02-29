return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
		})
    vim.cmd [[
        highlight GitSignsCurrentLineBlame guifg=#808080
    ]]
	end,
}
