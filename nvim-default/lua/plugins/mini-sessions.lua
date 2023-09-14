return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {},
  keys = {
    vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {}),
  },
}
