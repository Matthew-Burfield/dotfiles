-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Better vertical movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Better search and highlight
vim.keymap.set("n", "n", "nzzzv", { noremap = true, desc = "" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, desc = "" })
vim.keymap.set("n", "*", "*zzzv", { noremap = true, desc = "" })
vim.keymap.set("n", "#", "#zzzv", { noremap = true, desc = "" })

-- Better paste
vim.keymap.set("v", "p", '"_dP', { noremap = true, desc = "" })
vim.keymap.set("n", "x", '"_x', { noremap = true, desc = "" })
vim.keymap.set("n", "X", '"_X', { noremap = true, desc = "" })
