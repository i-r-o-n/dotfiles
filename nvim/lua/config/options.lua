-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.env.PATH = vim.env.PATH .. ":/usr/local/texlive/2024/bin/x86_64-linux"

vim.o.shell = "/usr/bin/zsh"
vim.o.runtimepath = vim.o.runtimepath .. ",~/.config/nvim/lua/"

vim.o.conceallevel = 1
-- latex
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_mode = 0

-- ultisnips
vim.g.UltiSnipsSnippetDirectories = { "snips" }

vim.o.spelllang = "en_us"
-- vim.o.spell = true
