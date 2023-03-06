return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Nvim Tree" },
    },
    opts = function()
      local config = require("nvim-tree.config")
      local cb = config.nvim_tree_callback
      return {
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        diagnostics = {
          enable = true,
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        view = {
          mappings = {
            list = {
              { key = { "l", "<CR>", "o" }, cb = cb("edit") },
              { key = "h", cb = cb("close_node") },
              { key = "v", cb = cb("vsplit") },
            },
          },
        },
        renderer = {
          root_folder_modifier = ":t",
          highlight_git = true,
        },
      }
    end,
  },
}
