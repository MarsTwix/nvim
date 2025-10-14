return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = function()
		require("dashboard").setup()

		-- Function to check if there are no real buffers left
		local function is_last_buffer()
			local listed_buffers = {}

			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if
					vim.api.nvim_buf_is_valid(buf)
					and vim.bo[buf].buflisted
					and vim.api.nvim_buf_get_name(buf) ~= ""
					and vim.bo[buf].buftype == ""
				then
					table.insert(listed_buffers, buf)
				end
			end

			return #listed_buffers == 0
		end

		-- Create the autocommand
		vim.api.nvim_create_autocmd({ "BufDelete" }, {
			group = vim.api.nvim_create_augroup("DashboardOnLastBuffer", { clear = true }),
			callback = function()
				-- Schedule to run after the buffer is actually deleted
				vim.schedule(function()
					if is_last_buffer() then
						vim.cmd("Dashboard")
					end
				end)
			end,
			desc = "Open dashboard when the last buffer is deleted",
		})
	end,
}
