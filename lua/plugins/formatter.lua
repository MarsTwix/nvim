return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "prettierd", "eslint_d" },
				html = { "prettierd" },
				css = { "prettierd" },
				scss = { "prettierd" },
				json = { "prettierd" },
				cs = { "csharpier" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})
	end,
}
