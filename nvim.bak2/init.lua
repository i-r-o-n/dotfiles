--lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })

end
vim.opt.rtp:prepend(lazypath)

local opts = {}
require("lazy").setup(opts)

require("lazy").setup("plugins")

local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", },
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },  
})

require("a")
