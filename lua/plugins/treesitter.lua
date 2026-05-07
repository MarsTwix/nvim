return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter").setup()

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "vim", "lua", "typescript", "html", "css", "scss", "cs", "csharp", "htmlangular" },
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
