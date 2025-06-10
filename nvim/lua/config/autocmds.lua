-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- enable spell checking for certain file types
vim.cmd([[autocmd FileType markdown,tex,html,text setlocal spell]])

-- disable comment formatting on lines opened after comment
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove("r")
    vim.opt.formatoptions:remove("o")
  end,
})

vim.api.nvim_create_user_command("Setwd", function()
  vim.cmd("cd " .. vim.fn.expand("%:p:h"))
end, {})

-- BUG: potential issue when opening from yazi

-- reopen dashboard on all buffers closed
vim.api.nvim_create_augroup("DashboardAutoOpen", { clear = true })
vim.api.nvim_create_autocmd({ "BufDelete" }, {
  group = "DashboardAutoOpen",
  callback = function()
    vim.schedule(function()
      local buffers = vim.tbl_filter(function(buf)
        return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted and vim.api.nvim_buf_get_name(buf) ~= ""
      end, vim.api.nvim_list_bufs())
      if #buffers == 0 then
        Snacks.dashboard({ win = 0, buf = 0 })
      end
    end)
  end,
})

-- force set file type
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "" or vim.bo.filetype == "nil" then
      vim.bo.filetype = vim.fn.expand("%:e")
    end
  end,
})

-- trim whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

local latex_utils = require("scripts.latex_utils")

local typst_utils = require("scripts.typst_utils")

-- load custom typst commands for typst files
vim.api.nvim_create_autocmd({ "filetype", "vimenter", "bufenter", "bufwinenter" }, {
  pattern = { "typst" }, -- don't know which is the proper filetype
  callback = function()
    typst_utils.setup_typst_commands()
  end,
})

-- load custom latex commands for latex files
vim.api.nvim_create_autocmd({ "FileType", "VimEnter", "BufEnter", "BufWinEnter" }, {
  pattern = { "tex", "latex" },
  callback = function()
    latex_utils.setup_latex_commands()
  end,
})

-- load custom latex commands in working directories
-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   callback = function()
--     local cwd = vim.fn.getcwd()
--     if string.match(cwd, "~/docs/latex") then
--       latex_utils.setup_latex_commands()
--     end
--   end,
-- })

-- global utility commands
require("scripts.repeat_command").setup_util_commands()

-- TODO: control activation in typst
-- setup formatting
require("conform").setup({
  formatters_by_ft = {
    typst = { "typstyle" },
  },
})
