return {
  "vuki656/package-info.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>ns", "<cmd>lua require('package-info').show()<cr>", desc = "Show the package info of package.json" },
  },
  opts = function()
    return {
      colors = {
        up_to_date = "#FF5733",
        outdated = "#33FF3C",
      },
    }
  end,
}
