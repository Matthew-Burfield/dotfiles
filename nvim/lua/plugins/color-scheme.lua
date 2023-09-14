return {
  { "neanias/everforest-nvim", version = false, name = "everforest", opts = { background = "medium" } },
  -- { "shaunsingh/nord.nvim", name = "nord" },
  -- { "AlexvZyl/nordic.nvim", name = "nordic" },
  -- { "savq/melange-nvim", name = "melange" },
  -- { "mhartington/oceanic-next", name = "oceanic-next" },
  --

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
