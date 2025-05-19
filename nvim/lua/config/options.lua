-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- path
vim.o.shell = "/bin/nu"

vim.o.runtimepath = vim.o.runtimepath .. ",~/.config/nvim/lua/"

-- display
vim.o.encoding = "utf-8"
vim.o.guifont = "JetBrainsMono Nerd Font:h12"

-- tmux
vim.o.termguicolors = true

vim.o.wrap = true
vim.o.linebreak = true
vim.o.scrolloff = 8

vim.o.conceallevel = 2

vim.o.spelllang = "en_us"
-- vim.o.spell = true

vim.g.maplocalleader = ","

-- latex
-- vim.env.PATH = vim.env.PATH .. ":/usr/local/texlive/2024/bin/x86_64-linux"
-- vim.g.tex_flavor = "latex"
-- vim.g.vimtex_view_method = "zathura"
-- vim.g.vimtex_quickfix_mode = 0
-- vim.g.tex_conceal = "abdmg"
-- vim.g.vimtex_compiler_latexmk = {
--   options = {
--     "-lualatex",
--     "-file-line-error",
--     "-synctex=1",
--     "-interaction=nonstopmode",
--   },
-- }

-- ultisnips
vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/snips" }

-- typst
vim.g.typst_pdf_viewer = "zathura"
vim.g.typst_conceal = 1
vim.g.typst_folding = 1

-- agda
vim.g.cornelis_use_global_binary = 1
vim.g.cornelis_split_location = "vertical"
