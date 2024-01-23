return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"lua",
					"vimdoc",
					"typescript",
					"tsx",
					"html",
					"css",
					"javascript",
					"json",
					"yaml",
          "elixir",
          "eex",
          "heex",
          "surface",
				},
        sync_install = false,
        auto_install = true,
				highlight = { enable = true },
			})
		end,
	},
}
