return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader><leader>", "<cmd>Telescope find_files<CR>", desc = "(Telescope) Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "(Telescope) Find a string" },
    { "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "(Telescope) Find current word" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "(Telescope) Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "(Telescope) Find Help" },
    { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "(Telescope) Find keymaps" },
    { "<leader>fc", "<cmd>Telescope commands<CR>", desc = "(Telescope) Find commands" },
    { "<leader>fs", "<cmd>Telescope search_history<CR>", desc = "(Telescope) Find search history" },
    { "<leader>fp", "<cmd>Telescope registers<CR>", desc = "(Telescope) Find (paste) registers" },
  },
}
