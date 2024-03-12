return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup({
      nextls = { enable = false },
      credo = { enable = true },
      elixirls = {
        enable = true,
        tag = "v0.20.0",
        settings = elixirls.settings({
          dialyzerEnabled = false,
          enableTestLenses = false,
        }),
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
