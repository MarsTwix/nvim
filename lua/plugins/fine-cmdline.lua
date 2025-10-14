return {
	"VonHeikemen/fine-cmdline.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		local fine = require("fine-cmdline")

		fine.setup({
			cmdline = {
				prompt = " ",
			},
		})
		vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
	end,
}
