local M = {}

M.setup_latex_commands = function()
  vim.api.nvim_create_user_command("LatexNewSection", function()
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

  vim.api.nvim_create_user_command("LatexCompileProblems", function()
    local current_dir = vim.fn.expand("%:p:h")
    local cmd = string.format('nu ~/.config/nvim/scripts/tex/export-problems.nu "%s"', current_dir)

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
          vim.api.nvim_echo({ { "Project problems compiled successfully", "Normal" } }, true, {})
        else
          vim.api.nvim_echo({ { "Failed to compile project problems", "ErrorMsg" } }, true, {})
        end
      end,
    })
  end, {})

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

  -- vim.api.nvim_set_keymap("n", "\\ur", ":call UltiSnips#RefreshSnippets()<CR>", { noremap = true, silent = true })
  -- these dont' need to be defined here
  -- vim.g.UltiSnipsExpandTrigger = "<tab>"
  -- vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
  -- vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"

  -- latex build (handled by vimtex)
  -- vim.api.nvim_set_keymap("n", "<A-b>", ":!lualatex %<CR>", { noremap = true, silent = true })
end

return M
