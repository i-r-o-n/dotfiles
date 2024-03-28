-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.env.PATH = vim.env.PATH .. ":/usr/local/texlive/2024/bin/x86_64-linux"

vim.o.shell = "/usr/bin/zsh"
vim.o.runtimepath = vim.o.runtimepath .. ",~/.config/nvim/lua/"

-- display
vim.o.encoding = "utf-8"
vim.o.guifont = "JetBrains Mono Nerd Font:h12"

vim.o.conceallevel = 1

-- layout switcher
vim.g.XkbSwitchEnabled = 1
vim.g.XkbSwitchLib = "/usr/local/lib/libxkbswitch.so"
vim.g.XkbSwitchNLayout = "us"
vim.g.XkbSwitchILayout = "semimak"

-- latex
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = "abdmg"

-- ultisnips
vim.g.UltiSnipsSnippetDirectories = { "../snips" }

vim.o.spelllang = "en_us"
-- vim.o.spell = true
