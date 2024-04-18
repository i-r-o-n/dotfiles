return {
  { "nvim-tree/nvim-web-devicons" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup({
        filesystem = {
          commands = {
            -- command to open file in default application
            system_open = function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.jobstart({ "xdg-open", path }, { detach = true })
            end,

            -- over write default 'delete' command to 'trash'.
            delete = function(state)
              local inputs = require("neo-tree.ui.inputs")
              local path = state.tree:get_node().path
              local msg = "Are you sure you want to trash " .. path
              inputs.confirm(msg, function(confirmed)
                if not confirmed then
                  return
                end

                vim.fn.system({ "trash", vim.fn.fnameescape(path) })
                require("neo-tree.sources.manager").refresh(state.name)
              end)
            end,

            -- over write default 'delete_visual' command to 'trash' x n.
            delete_visual = function(state, selected_nodes)
              local inputs = require("neo-tree.ui.inputs")

              -- get table items count
              function GetTableLen(tbl)
                local len = 0
                for n in pairs(tbl) do
                  len = len + 1
                end
                return len
              end

              local count = GetTableLen(selected_nodes)
              local msg = "Are you sure you want to trash " .. count .. " files ?"
              inputs.confirm(msg, function(confirmed)
                if not confirmed then
                  return
                end
                for _, node in ipairs(selected_nodes) do
                  vim.fn.system({ "trash", vim.fn.fnameescape(node.path) })
                end
                require("neo-tree.sources.manager").refresh(state.name)
              end)
            end,
          },
          components = {
            harpoon_index = function(config, node, _)
              local harpoon_list = require("harpoon"):list()
              local path = node:get_id()
              local harpoon_key = vim.uv.cwd()

              for i, item in ipairs(harpoon_list.items) do
                local value = item.value
                if string.sub(item.value, 1, 1) ~= "/" then
                  value = harpoon_key .. "/" .. item.value
                end

                if value == path then
                  vim.print(path)
                  return {
                    text = string.format(" ⥤ %d", i), -- <-- Add your favorite harpoon like arrow here
                    highlight = config.highlight or "NeoTreeDirectoryIcon",
                  }
                end
              end
              return {}
            end,
          },
          -- follow_current_file = {
          --   enabled = true,
          --   leave_dirs_open = false,
          -- },
          renderers = {
            file = {
              { "icon" },
              { "name", use_git_status_colors = true },
              { "harpoon_index" }, --> This is what actually adds the component in where you want it
              { "diagnostics" },
              { "git_status", highlight = "NeoTreeDimText" },
            },
          },
        },
        window = {
          mappings = {
            ["o"] = "system_open",
            ["e"] = function()
              vim.api.nvim_exec("Neotree focus filesystem left", true)
            end,
            ["b"] = function()
              vim.api.nvim_exec("Neotree focus buffers left", true)
            end,
            ["g"] = function()
              vim.api.nvim_exec("Neotree focus git_status left", true)
            end,
          },
        },
      })
    end,
  },
}
