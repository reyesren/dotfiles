-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Scroll viewport 10 lines
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<A-J>", "10j", { desc = "Scroll down 10 lines" })
map("n", "<A-K>", "10k", { desc = "Scroll up 10 lines" })

map({ "n", "v" }, "d", '"_d', opts)
map({ "n", "v" }, "D", '"_D', opts)
map({ "n", "v" }, "c", '"_c', opts)
map({ "n", "v" }, "C", '"_C', opts)

-- Make x (and X) not yank
map("n", "x", '"_x', opts)
map("n", "X", '"_X', opts)
