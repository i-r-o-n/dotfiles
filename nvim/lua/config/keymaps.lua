-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- no longer used
-- vim.keymap.set("n", "<leader>uv", vim.cmd.Ex)

-- exit insert mode
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", { noremap = true })
-- vim.api.nvim_set_keymap("i", "dd", "<Esc>", { noremap = true })

-- correct last spelling mistake in insert mode
vim.api.nvim_set_keymap("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true })

-- enter zen mode
-- vim.api.nvim_set_keymap("n", "<leader>uz", ":ZenMode<CR>", { noremap = true, silent = true })

-- ultisnips reload snippets
vim.api.nvim_create_autocmd("FileType", {
  pattern = "snippets",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "\\ur",
      ":call UltiSnips#RefreshSnippets()<CR>",
      { noremap = true, silent = true }
    )
  end,
})

vim.api.nvim_set_keymap("n", "<leader>bs", ":noautocmd write<CR>", { noremap = true })

-- alternate layout support
-- local layout = require("config.layout")
-- layout.remap_keys()

-- vim.api.nvim_set_keymap("n", "\\ur", ":call UltiSnips#RefreshSnippets()<CR>", { noremap = true, silent = true })
-- these dont' need to be defined here
-- vim.g.UltiSnipsExpandTrigger = "<tab>"
-- vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
-- vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"

-- latex build (handled by vimtex)
-- vim.api.nvim_set_keymap("n", "<A-b>", ":!lualatex %<CR>", { noremap = true, silent = true })

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
