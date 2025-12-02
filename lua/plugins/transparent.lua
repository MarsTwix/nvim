return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		local transparent = require("transparent")
		transparent.setup({
			extra_groups = {
				"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
				"NvimTreeNormal", -- NvimTree
			},
			exclude_groups = {
				"TelescopePreviewLine",
			},
		})
		transparent.clear_prefix("Telescope")
		-- transparent.clear_prefix("lualine")
	end,
}
