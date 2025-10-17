return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				ts = { "prettierd" },
				html = { "prettierd" },
				scss = { "prettierd" },
				json = { "prettierd" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})
	end,
}
