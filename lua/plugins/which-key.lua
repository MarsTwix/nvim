return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		local groups = {
			{ "<leader>b", group = "buffer" },
			{ "<leader>c", group = "code" },
			{ "<leader>e", group = "explorer" },
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>o", group = "opencode" },
			{ "<leader>r", group = "rename" },
			{ "<leader>t", group = "toggle" },
			{ "<leader>x", group = "diagnostics" },
		}

		wk.add(groups)
	end,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
