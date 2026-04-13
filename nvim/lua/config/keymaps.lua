-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Keep pane navigation mappings here instead of the plugin spec. In LazyVim,
-- lazy plugin key declarations for vim-tmux-navigator can be unreliable.
-- Defining them here makes Alt-h/j/k/l available consistently at startup.

-- Normal-mode pane navigation across Neovim splits and tmux panes.
vim.keymap.set("n", "<M-h>", "<Cmd>TmuxNavigateLeft<CR>", { desc = "Navigate h" })
vim.keymap.set("n", "<M-j>", "<Cmd>TmuxNavigateDown<CR>", { desc = "Navigate j" })
vim.keymap.set("n", "<M-k>", "<Cmd>TmuxNavigateUp<CR>", { desc = "Navigate k" })
vim.keymap.set("n", "<M-l>", "<Cmd>TmuxNavigateRight<CR>", { desc = "Navigate l" })

-- Insert mode must leave insert before changing windows.
vim.keymap.set("i", "<M-h>", "<Esc><Cmd>TmuxNavigateLeft<CR>", { desc = "Navigate h" })
vim.keymap.set("i", "<M-j>", "<Esc><Cmd>TmuxNavigateDown<CR>", { desc = "Navigate j" })
vim.keymap.set("i", "<M-k>", "<Esc><Cmd>TmuxNavigateUp<CR>", { desc = "Navigate k" })
vim.keymap.set("i", "<M-l>", "<Esc><Cmd>TmuxNavigateRight<CR>", { desc = "Navigate l" })

-- Terminal mode must leave terminal-input mode before switching panes.
vim.keymap.set("t", "<M-h>", [[<C-\><C-n><Cmd>TmuxNavigateLeft<CR>]], { desc = "Navigate h" })
vim.keymap.set("t", "<M-j>", [[<C-\><C-n><Cmd>TmuxNavigateDown<CR>]], { desc = "Navigate j" })
vim.keymap.set("t", "<M-k>", [[<C-\><C-n><Cmd>TmuxNavigateUp<CR>]], { desc = "Navigate k" })
vim.keymap.set("t", "<M-l>", [[<C-\><C-n><Cmd>TmuxNavigateRight<CR>]], { desc = "Navigate l" })
