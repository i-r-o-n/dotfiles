local M = {}

M.setup_latex_commands = function()
  vim.api.nvim_create_user_command("NewLatexSection", function()
    local current_dir = vim.fn.expand("%:p:h")
    local cmd = string.format('nu ~/.config/nvim/scripts/tex/new-section.nu "%s"', current_dir)

    vim.fn.jobstart(cmd, {
      on_stdout = function(_, data)
        if data and data[1] ~= "" then
          vim.api.nvim_echo({ { table.concat(data, "\n"), "Normal" } }, true, {})
        end
      end,
      on_stderr = function(_, data)
        if data and data[1] ~= "" then
          vim.api.nvim_echo({ { table.concat(data, "\n"), "ErrorMsg" } }, true, {})
        end
      end,
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          vim.api.nvim_echo({ { "New LaTeX section created successfully", "Normal" } }, true, {})
        else
          vim.api.nvim_echo({ { "Failed to create new LaTeX section", "ErrorMsg" } }, true, {})
        end
      end,
    })
  end, {})
end

return M
