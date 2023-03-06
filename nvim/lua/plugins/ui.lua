return {
  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local package_info = require("package-info")

      table.insert(opts.sections.lualine_y, {
        function()
          return package_info.get_status()
        end,
      })
    end,
  },
}
