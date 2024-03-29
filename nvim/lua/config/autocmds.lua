-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Autocommand to enable spell checking for certain file types
vim.cmd([[
  autocmd FileType markdown,tex,html,text setlocal spell
]])

-- colorizer
require("colorizer").setup()

-- keyboard layout force change
-- vim.api.nvim_create_autocmd("InsertEnter", {
--   pattern = "*",
--   callback = function()
--     vim.fn.system("setxkbmap semimak")
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   pattern = "*",
--   callback = function()
--     vim.fn.system("setxkbmap us")
--   end,
-- })
