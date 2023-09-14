return {
  --   {
  --     "mhartington/formatter.nvim",
  --     keys = { { "<Leader>f;", "<CMD>FormatWrite<CR>", desc = "Use Formatter.nvim" } },
  --     config = function()
  --       require("formatter").setup({
  --         filetype = {
  --           typescript = {
  --             require("formatter.filetypes.typescript").prettier,
  --           },
  --           typescriptreact = {
  --             require("formatter.filetypes.typescriptreact").prettier,
  --           },
  --         },
  --       })
  --     end,
  --   },

  -- null ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.eslint_d,
        },
      }
    end,
  },
}
