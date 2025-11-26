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
				ensure_installed = {
					-- Lua
					"lua_ls",
					"stylua",
					"luacheck",
					-- Markdown
					"vale",
					-- Typescript
					"ts_ls",
					-- HTML
					"html",
					"markuplint",
					-- CSS, SCSS
					"cssls",
					"stylelint",
					-- Frontend
					"prettierd",
					"eslint_d",
					-- C#
					"omnisharp",
					"csharpier",
					-- Python
					"pyright",
					"black",
					-- Angular
					"angularls",
				},
			})
		end,
	},
}
