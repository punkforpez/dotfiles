-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--vim.keymap.set("n", "<leader>j", ":bn<CR>")
--vim.keymap.set("n", "<leader>k", ":bp<CR>")
--vim.keymap.set("n", "<leader>X", ":bd<CR>")
local builtin = require("telescope.builtin")

-- Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Nvim-comment
--vim.keymap.set({ "n", "v" }, "<leader>/", ":CommentToggle<cr>")
