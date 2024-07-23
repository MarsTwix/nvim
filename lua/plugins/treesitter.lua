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
					"ruby",
				},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})

			local parsers = require("nvim-treesitter.parsers")

			local parser_config = parsers.get_parser_configs()
			parser_config.ruby.filetype_to_parsername = "jb"
		end,
	},
}
