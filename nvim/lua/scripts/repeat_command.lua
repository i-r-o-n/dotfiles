-- :lua for i=1,n do vim.cmd('VimCommand') end
local M = {}

function M.repeat_command(command, count)
  for _ = 1, count do
    vim.cmd(command)
  end
end

M.setup_util_commands = function()
  vim.api.nvim_create_user_command("RepeatCmd", function(opts)
    local args = vim.split(opts.args, " ", true)
    local count = tonumber(args[1]) or 1
    local cmd = table.concat({ unpack(args, 2) }, " ")
    M.repeat_command(cmd, count)
  end, { nargs = "+" })
end

return M
