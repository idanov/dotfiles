-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-save configuration
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Auto-save on focus lost and buffer leave
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  group = augroup("auto_save"),
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})

-- Auto-save after text changes (with debounce)
local save_timer = nil
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
  group = augroup("auto_save_debounced"),
  callback = function()
    if save_timer then
      vim.fn.timer_stop(save_timer)
    end
    
    save_timer = vim.fn.timer_start(500, function()
      if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
        vim.cmd("silent! write")
      end
    end)
  end,
})
