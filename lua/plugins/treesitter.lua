return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
        "vimdoc",
        "vim",
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      -- indent = { enable = true },
    })
  end,
}
