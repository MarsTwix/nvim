return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = { char = "│" },
    scope = {
      enabled = false,
    },
    exclude = {
      filetypes = { "help", "dashboard", "lazy", "mason" },
    },
  },
}
