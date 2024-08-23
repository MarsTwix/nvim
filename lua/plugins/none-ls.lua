local copyTable = function(table)
	local copy = {}
	for key, value in pairs(table) do
		copy[key] = value
	end
	return copy
end

local appendTables = function(t1, t2)
	local result = copyTable(t1)
	for key, value in pairs(t2) do
		result[#result + key] = value
	end
	return result
end

local convertToSources = function(null_ls, formatters, linters)
	local sources = {}
	for _, formatter in pairs(formatters) do
		table.insert(sources, null_ls.builtins.formatting[formatter])
	end
	for _, linter in pairs(linters) do
		table.insert(sources, null_ls.builtins.diagnostics[linter])
	end
	return sources
end

local _formatters = require("formatters")
local _linters = require("linters")

return {
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = appendTables(_formatters, _linters),
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				-- you can reuse a shared lspconfig on_attach callback here
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
								-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,

				sources = convertToSources(null_ls, _formatters, _linters),
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
}
