return {
  "folke/noice.nvim",
  opts = {
    presets = {
      bottom_search = false, -- use a new centered cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    views = {
      cmdline_popup = {
        border = {
          style = "none",
          padding = { 1, 1 },
        },
        -- win_options = {
        --   winhighlight = {
        --     NormalFloat = "NormalFloat",
        --     FloatBorder = "NormalBorder",
        --   },
        -- },
      },
      popupmenu = {
        border = {
          style = "none",
          padding = { 1, 1 },
        },
      },
    },
  },
}
