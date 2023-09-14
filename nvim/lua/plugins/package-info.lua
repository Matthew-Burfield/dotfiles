return {
  "vuki656/package-info.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>ns",
      "<cmd>lua require('package-info').show({ force = true })<cr>",
      desc = "Show the package info of package.json",
    },
    { "<leader>nd", "<cmd>lua require('package-info').delete()<cr>", desc = "Delete the hovered package" },
    { "<leader>nu", "<cmd>lua require('package-info').update()<cr>", desc = "Update the hovered package" },
    {
      "<leader>ni",
      "<cmd>lua require('package-info').install()<cr>",
      desc = "Install a new package",
    },
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
