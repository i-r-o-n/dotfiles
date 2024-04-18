return {
  {
    "echasnovski/mini.files",
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
      options = {
        -- Whether to use for editing directories
        -- Disabled by default in LazyVim because neo-tree is used for that
        use_as_default_explorer = false,
      },
    },
    keys = {
      {
        "<leader>fm",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
      {
        "<leader>fM",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      local show_dotfiles = true
      local filter_show = function(fs_entry)
        return true
      end
      local filter_hide = function(fs_entry)
        return not vim.startswith(fs_entry.name, ".")
      end

      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        require("mini.files").refresh({ content = { filter = new_filter } })
      end

      -- local safe_close_last_buffer = function()
      --   local buf_id = vim.api.nvim_get_current_buf()
      --   if #vim.api.nvim_list_bufs() <= 1 then
      --     vim.api.nvim_command("enew") -- Opens a new buffer
      --   end
      --   vim.api.nvim_buf_delete(buf_id, { force = true })
      -- end

      local close_buffer_if_open = function()
        -- fetch the file system entry for the current line
        local fs_entry = require("mini.files").get_fs_entry() -- Default to current buffer implicitly
        if fs_entry and fs_entry.path then
          -- check if the path is open in any buffer
          for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buffer) and vim.api.nvim_buf_get_name(buffer) == fs_entry.path then
              -- close the buffer if it is open
              -- first, prevent closing the last buffer or open a new one
              if #vim.api.nvim_list_bufs() <= 1 then
                vim.api.nvim_command("enew") -- Opens a new buffer
              end
              vim.api.nvim_buf_delete(buffer, { force = true })
              -- notify user that the file has been closed
              vim.notify("Closed buffer for: " .. fs_entry.path, vim.log.levels.INFO)
              return
            end
          end
        end
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak left-hand side of mapping to your liking
          vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id, desc = "Toggle Hidden Files" })
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesActionRename",
        callback = function(event)
          LazyVim.lsp.on_rename(event.data.from, event.data.to)
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          vim.keymap.set("n", "x", close_buffer_if_open, { buffer = buf_id, desc = "Close entry buffer" })
        end,
      })
    end,
  },
}
