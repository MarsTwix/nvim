local codex_term

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		size = function(term)
			if term.direction == "vertical" then
				return 70
			end
			return 15
		end,
		persist_size = false,
		open_mapping = [[<c-\>]],
		shade_terminals = true,
		direction = "float",
		float_opts = {
			border = "rounded",
		},
		on_open = function(term)
			if term.direction == "vertical" then
				vim.cmd("wincmd H")
				vim.api.nvim_win_set_width(0, 70)
				vim.wo.winfixwidth = true
			end
		end,
	},
	keys = {
		{
			"<leader>tt",
			function()
				local Terminal = require("toggleterm.terminal").Terminal
				if not codex_term then
					codex_term = Terminal:new({
						cmd = "codex",
						direction = "vertical",
						hidden = true,
					})
				end
				codex_term:toggle()
			end,
			desc = "Terminal (Codex, left)",
		},
	},
}
