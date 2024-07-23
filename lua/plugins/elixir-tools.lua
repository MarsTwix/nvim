return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup({
      nextls = { enable = false },
      elixirls = {
        enable = true,
        tag = "v0.22.1",
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
