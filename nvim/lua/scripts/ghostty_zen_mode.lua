-- In your Neovim config
local function toggle_terminal_zen(entering_zen)
  if entering_zen then
    -- Commands to make Ghostty more minimal
    vim.fn.system("ghostty set-prop padding=20")
    vim.fn.system("ghostty set-prop window.transparent=false")
    -- Add other Ghostty commands as needed
  else
    -- Restore normal Ghostty settings
    vim.fn.system("ghostty set-prop padding=0")
    vim.fn.system("ghostty set-prop window.transparent=true")
  end
end

-- Hook this into zen-mode events
require("zen-mode").setup({
  on_open = function()
    toggle_terminal_zen(true)
  end,
  on_close = function()
    toggle_terminal_zen(false)
  end,
})
