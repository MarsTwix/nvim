return {
	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			handlers = {
				function(server)
					local lspconfig = require("lspconfig")
					local capabilities = require("cmp_nvim_lsp").default_capabilities()

					local settings = {}
					if server == "lua_ls" then
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								workspace = { checkThirdParty = false },
								telemetry = { enable = false },
							},
						}
					end

					lspconfig[server].setup({
						capabilities = capabilities,
						settings = settings,
					})
				end,
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = { "lua_ls", "stylua", "luacheck", "vale", "ts_ls", "prettierd", "eslint_d" },
			})
		end,
	},
}
