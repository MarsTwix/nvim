local LSPs = require("LSPs")

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = LSPs,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      for _, lsp in ipairs(LSPs) do
        if lsp == "elixirls" then
          lspconfig[lsp].setup({
            cmd = { "$HOME/elixir-ls/language_server.sh" },
            capabilities = capabilities,
          })
        else
          lspconfig[lsp].setup({
            capabilities = capabilities,
          })
        end
      end

      local function filter(arr, fn)
        if type(arr) ~= "table" then
          return arr
        end

        local filtered = {}
        for k, v in pairs(arr) do
          if fn(v, k, arr) then
            table.insert(filtered, v)
          end
        end

        return filtered
      end

      local function filterReactDTS(value)
        return string.match(value.filename, "react/index.d.ts") == nil
      end

      local function on_list(options)
        local items = options.items
        if #items > 1 then
          items = filter(items, filterReactDTS)
        end

        vim.fn.setqflist({}, " ", { title = options.title, items = items, context = options.context })
        vim.api.nvim_command("cfirst")
      end

      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition({ on_list = on_list })
      end)

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>e", ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>', {})
    end,
  },
}
