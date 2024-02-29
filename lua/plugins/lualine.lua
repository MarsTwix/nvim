return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{
						"buffers",
						symbols = {
							alternate_file = "",
						},
					},
				},
				lualine_c = { "branch", "diff", "diagnostics" },
			},
		})

		local bufferClose = function(force)
			if force == nil then
				force = false
			end

			local count = 0
			buftypes = vim.api.nvim_list_bufs()
			for _, bufname in pairs(buftypes) do
				local buftype = vim.api.nvim_buf_get_option(bufname, "buftype")
				if vim.api.nvim_buf_is_loaded(bufname) and buftype == "" then
					count = count + 1
				end
			end

			if force then
				vim.cmd("bdelete")
			else
				vim.cmd("bdelete!")
			end

			if count == 1 then
				vim.cmd("Dashboard")
			end
		end

		local bufferForceClose = function()
			bufferClose(true)
		end

		vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
		vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { silent = true })
		vim.keymap.set("n", "<leader>x", bufferClose, { silent = true })
		vim.keymap.set("n", "<S-leader>X", bufferForceClose, { silent = true })
	end,
}
