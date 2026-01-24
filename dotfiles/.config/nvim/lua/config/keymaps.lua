-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Scroll viewport 10 lines
vim.keymap.set("n", "<A-J>", "10j", { desc = "Scroll down 10 lines" })
vim.keymap.set("n", "<A-K>", "10k", { desc = "Scroll up 10 lines" })
