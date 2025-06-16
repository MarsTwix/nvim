return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup()
    -- Disable default status line
    vim.o.laststatus = 3 -- Global statusline
    vim.o.showmode = false -- Don't show mode in command line

    -- Disable default tabline if you don't want it
    vim.o.showtabline = 0 -- Never show tabline

    -- Disable ruler (position info in bottom right)
    vim.o.ruler = false
  end,
}
