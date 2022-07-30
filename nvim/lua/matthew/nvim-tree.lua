local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = true,
    },
  },
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
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
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
  renderer = {
    root_folder_modifier = ":t",
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder = true,
        folder_arrow = true,
        file = true,
      },
    },
  },
}
