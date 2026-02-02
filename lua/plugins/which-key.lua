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
			{ "<leader>r", group = "rename" },
			{ "<leader>t", group = "toggle" },
			{ "<leader>x", group = "diagnostics" },
		}

		if wk.add then
			wk.add(groups)
		else
			wk.register({
				b = { name = "buffer" },
				c = { name = "code" },
				e = { name = "explorer" },
				f = { name = "find" },
				g = { name = "git" },
				r = { name = "rename" },
				t = { name = "toggle" },
				x = { name = "diagnostics" },
			}, { prefix = "<leader>" })
		end
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
