return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  branch = "v2.x",
  opts = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Replace these with the tools you have installed
        -- make sure the source name is supported by null-ls
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.eslint_d,
      },
    })
  end,
}
