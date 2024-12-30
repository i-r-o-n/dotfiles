-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim local file explore
-- vim.keymap.set("n", "<leader>uv", vim.cmd.Ex)

-- exit insert mode
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", { noremap = true })
-- vim.api.nvim_set_keymap("i", "dd", "<Esc>", { noremap = true })

-- correct last spelling mistake in insert mode
vim.api.nvim_set_keymap("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true })

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

-- save without formatting
vim.api.nvim_set_keymap("n", "<leader>bs", ":noautocmd write<CR>", { noremap = true })

-- Function to delete LSP log file with confirmation
vim.api.nvim_create_user_command("ClearLspLog", function()
  local log_path = vim.fn.expand("~/.local/state/nvim/lsp.log")

  local choice = vim.fn.confirm("Delete LSP log file?\n" .. log_path, "&Yes\n&No", 2)

  if choice == 1 then
    local success, error = os.remove(log_path)
    if success then
      vim.notify("LSP log file deleted successfully", vim.log.levels.INFO)
    else
      vim.notify("Failed to delete LSP log file: " .. (error or "unknown error"), vim.log.levels.ERROR)
    end
  end
end, {})

vim.keymap.set("n", "<leader>cL", ":ClearLspLog<CR>", {
  silent = true,
  noremap = true,
  desc = "Clear LSP log file",
})

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
