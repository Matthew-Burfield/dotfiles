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
-- Ignore visual mode
keymap("n", "Q", "<nop>", opts)

-- Open up file explorer
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Search for the word you are hoving over inside the current buffer
keymap("n", "<leader>bs", "/<C-R>=escape(expand(\"<cWORD>\"), \"/\")<CR><CR>", opts)

-- Do a local global subsitute on the current word
keymap("n", "<leader>s", ":%s /<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", opts)

-- Don't clog up the register
keymap("n", "<leader>y", "\"+y", opts)
keymap("n", "<leader>d", "\"_d", opts)

-- Yank the entire file contents
keymap("n", "<leader>Y", "gg\",+yG", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Don't clog up the register when pasting
keymap("v", "<leader>p", "\"_dP", opts)
keymap("v", "<leader>y", "\"+y", opts)
keymap("v", "<leader>d", "\"_d", opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>lua require(\"telescope.builtin\").find_files()<CR>", opts)
keymap("n", "<leader>fb", "<cmd>lua require(\"telescope\").extensions.file_browser.file_browser()<CR>", opts)
keymap("n", "<leader>vrc", "<cmd>lua require(\"matthew.telescope\").search_dotfiles()<CR>", opts)
--nnoremap <leader>ff <cmd>lua require("telescope.builtin").find_files()<CR>
--nnoremap <leader>fb <cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>
--nnoremap / <cmd>lua require("mattyb.telescope").current_buffer_fuzzy_find()<CR>
--nnoremap <leader>vrc <cmd>lua require("mattyb.telescope").search_dotfiles()<CR>
