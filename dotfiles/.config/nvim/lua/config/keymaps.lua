-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map({ "n", "x" }, "K", "10kzz", {
  noremap = true,
  remap = false,
  desc = "Move up 10 lines and center",
})

map({ "n", "x" }, "J", "10jzz", {
  noremap = true,
  remap = false,
  desc = "Move down 10 lines and center",
})

map("n", "<leader>ghq", "<cmd>only<cr>", { desc = "Close Diff View" })

pcall(vim.keymap.del, { "n", "x", "o" }, "]c")
pcall(vim.keymap.del, { "n", "x", "o" }, "[c")
