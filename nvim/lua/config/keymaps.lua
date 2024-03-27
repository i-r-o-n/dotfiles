-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Key mapping for correcting the last spelling mistake in insert mode
vim.api.nvim_set_keymap("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true })

-- ultisnips
-- vim.g.UltiSnipsExpandTrigger = "<tab>"
-- vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
-- vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"

vim.cmd([[
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
]])

-- nvim tmux navigator
-- require("nvim-tmux-navigation").setup({
--   disable_when_zoomed = true, -- defaults to false
--   keybindings = {
--     left = "<C-h>",
--     down = "<C-j>",
--     up = "<C-k>",
--     right = "<C-l>",
--     last_active = "<C-\\>",
--     next = "<C-Space>",
--   },
-- })
