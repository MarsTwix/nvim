return {
	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			automatic_enable = true,
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function(_, opts)
			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			})

			require("mason-lspconfig").setup(opts)
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
		},
		opts = {
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
		},
	},
}
