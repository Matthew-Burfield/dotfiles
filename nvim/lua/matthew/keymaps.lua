local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better movement
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Ignore visual mode
keymap("n", "Q", "<nop>", opts)

-- Open up file explorer
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Search for the word you are hoving over inside the current buffer
keymap("n", "<leader>bs", '/<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>', opts)

-- Do a local global subsitute on the current word
keymap("n", "<leader>s", ":%s /<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", opts)

-- close all buffers except the current one
keymap("n", "<leader>cab", ":%bdelete|edit #|normal `<CR>", opts)

-- Manage the quick fix list
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts)

-- Yank the entire file contents
keymap("n", "<leader>Y", 'gg",+yG', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Don't clog up the register when pasting
keymap("v", "<leader>p", '"_dP', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("v", "<leader>d", '"_d', opts)

-- Telescope
keymap("n", "<C-p>", '<cmd>lua require("telescope.builtin").git_files()<CR>', opts)
keymap("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
keymap("n", "<leader>fb", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>', opts)
-- Search and replace
keymap(
	"n",
	"<leader>ps",
	'<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep for > ") })<CR>',
	opts
)
-- after searching for a word and adding the list to the quick fix list, I can do a global replace with:
-- :cdo s/{word}/{replacement}/gc
-- :cfdo can be used if we want to be case-sensitive
-- potentially check out http://github.com/windwp/nvim-spectres as a search and replace plugin

-- Toggleterm
keymap("n", "<leader>vrc", "<cmd>lua _EDIT_NVIM_CONFIG()<CR>", opts)
keymap("n", "<leader>git", "<cmd>lua _GIT_TOGGLE()<CR>", opts)

-- Package Info
-- Show dependency versions
keymap("n", "<leader>ns", '<cmd>lua require("package-info").show<CR>', opts)
keymap("n", "<leader>nh", '<cmd>lua require("package-info").hide<CR>', opts)
keymap("n", "<leader>nu", '<cmd>lua require("package-info").update<CR>', opts)
keymap("n", "<leader>nd", '<cmd>lua require("package-info").delete<CR>', opts)
keymap("n", "<leader>ni", '<cmd>lua require("package-info").install<CR>', opts)
keymap("n", "<leader>nc", '<cmd>lua require("package-info").change_version<CR>', opts)
