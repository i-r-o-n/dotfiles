return {
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          -- check if the current buffer's filetype is 'kbd'
          if vim.bo.filetype == "kbd" then
            -- return the custom comment string for '.kbd' files
            return ";; %s"
          else
            -- for other filetypes, use 'ts_context_commentstring' or the default 'commentstring'
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
          end
        end,
      },
    },
  },
}
