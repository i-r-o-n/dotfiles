return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = require("lazyvim.config").icons

      vim.o.laststatus = vim.g.lualine_laststatus

      return {
        options = {
          theme = "catppuccin",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
          component_separators = "",
          -- section_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            {
              "branch",
              icon = "",
              -- color = function()
              --   -- tint background instead of catpuccin surface0
              --   -- BUG: separator gets removed on color change
              --   local mode_color = {
              --     n = { bg = "#313244" }, -- Normal mode
              --     i = { bg = "#334431" }, -- Insert mode
              --     v = { bg = "#a3be8c" }, -- Visual mode
              --     [""] = { bg = "#a3be8c" }, -- Visual Block mode
              --     V = { bg = "#a3be8c" }, -- Visual Line mode
              --     c = { bg = "#d08770" }, -- Command mode
              --     -- r Replace
              --     -- t Terminal
              --   }
              --   local mode = vim.fn.mode()
              --   if mode_color[mode] then
              --     return mode_color[mode]
              --   else
              --     return {} -- Default colors if mode not specified
              --   end
              -- end,
            },
          },

          lualine_c = {
            LazyVim.lualine.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { LazyVim.lualine.pretty_path() },
          },
          lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = LazyVim.ui.fg("Statement"),
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = LazyVim.ui.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = LazyVim.ui.fg("Debug"),
          },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = LazyVim.ui.fg("Special"),
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return ""
            end,
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
}
