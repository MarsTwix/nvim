return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")

    elixir.setup({
      nextls = { enable = false },
      credo = { enable = true },
      elixirls = {
        enable = true,
        tag = "v0.19.0",
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
