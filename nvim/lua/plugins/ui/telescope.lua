return {
  -- TODO: implement buffer closing from picker

  -- "nvim-telescope/telescope.nvim",
  -- opts = function(_, opts)
  --   local actions = require("telescope.actions")
  --   local action_state = require("telescope.actions.state")
  --
  --   local close_selected_buffer = function(prompt_bufnr)
  --     local current_picker = action_state.get_current_picker(prompt_bufnr)
  --
  --     local selection = action_state.get_selected_entry()
  --     if selection == nil then
  --       return
  --     end
  --
  --     vim.api.nvim_buf_delete(selection.bufnr, { force = false })
  --
  --     current_picker:refresh()
  --   end
  --
  --   opts.defaults = opts.defaults or {}
  --   opts.defaults.mappings = opts.defaults.mappings or { i = {}, n = {} }
  --   opts.defaults.mappings.i["<c-d>"] = close_selected_buffer
  --   opts.defaults.mappings.n["d"] = close_selected_buffer
  --   return opts
  -- end,
}
