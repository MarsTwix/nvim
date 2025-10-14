return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			handlers = {
				function(server)
					local lspconfig = require("lspconfig")
					local capabilities = require("cmp_nvim_lsp").default_capabilities()
					lspconfig[server].setup({ capabilities = capabilities })
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
				ensure_installed = { "lua_ls", "stylua", "luacheck", "vale" },
			})
		end,
	},
}
