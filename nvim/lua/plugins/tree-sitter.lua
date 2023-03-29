return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = {
      "bash",
      "help",
      "html",
      "javascript",
      "json",
      "lua",
      "luap",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    }
  end,
}
