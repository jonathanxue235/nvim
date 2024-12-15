-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Check if the current file type is cpp and bind the key

vim.keymap.set("n", "<D-s>", "<cmd>:w<CR>")
-- U = redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
