return {
	"rcarriga/nvim-notify",
	config = function()
		vim.notify = require("notify")
		require("telescope").load_extension("notify")
		vim.keymap.set("n", "<leader>fn", "<cmd>Telescope notify<CR>", { desc = "Notify history" })
	end,
}
