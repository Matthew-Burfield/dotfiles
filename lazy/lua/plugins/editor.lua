local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  -- local function opts(desc)
  --   return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  -- end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "s", "", { buffer = bufnr })
end

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
      return {
        on_attach = on_attach,
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
        renderer = {
          root_folder_modifier = ":t",
          highlight_git = true,
        },
      }
    end,
  },
}
