-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- auto update
local function auto_update_group(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {

  -- vim.api.nvim_set_option("t_SI", "\x1b[5 q"),
  -- vim.api.nvim_set_option("t_EI", "\x1b[1 q"),

  group = auto_update_group("autoupdate"),
  callback = function()
    if require("lazy.status").has_updates then
      require("lazy").update({ show = false })
    end
  end,
})
-- enable spell checking for certain file types
vim.cmd([[
  autocmd FileType markdown,tex,html,text setlocal spell
]])

-- colorizer
require("colorizer").setup()

-- disable comment formatting on lines opened after comment
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove("r")
    vim.opt.formatoptions:remove("o")
  end,
})

-- set file type
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.kbd", command = "set filetype=kbd" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "" then
      vim.bo.filetype = vim.fn.expand("%:e")
    end
  end,
})

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
