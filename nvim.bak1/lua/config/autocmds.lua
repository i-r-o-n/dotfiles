-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Autocommand to enable spell checking for certain file types
vim.cmd([[
  autocmd FileType markdown,tex,html,text setlocal spell
]])

-- latex global variables
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = "abdmg"

-- UltiSnips configuration
vim.g.UltiSnipsSnippetDirectories = { "snips" }
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"

-- colorscheme
vim.g.material_theme_style = "darker"
vim.g.material_terminal_italics = 1
vim.cmd([[colorscheme material]])

-- colorizer
require("colorizer").setup()
