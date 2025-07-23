-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- ESC to jj for quick NORMAL mode
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("n", "<leader>;", function()
  require("snacks").dashboard.open()
end, { desc = "Dashboard" })

vim.keymap.set("n", "<leader>fl", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
