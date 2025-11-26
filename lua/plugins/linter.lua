return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			lua = { "luacheck" },
			markdown = { "vale" },
			typescript = { "eslint_d" },
			html = { "markuplint" },
			htmlangular = { "markuplint" },
			css = { "stylelint" },
			scss = { "stylelint" },
		}
		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
