local M = {}

function M.toggle_terminal_zen_mode(entering_zen)
  if entering_zen then
    vim.fn.system('notify-send "neovim" "entering zen mode"')
  else
    vim.fn.system('notify-send "neovim" "leaving zen mode"')
  end
end

return M
