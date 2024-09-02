return {
  -- { "numToStr/Comment.nvim" },
  -- { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          if not pcall(require, "ts_context_commentstring.internal") then
            return vim.bo.commentstring
          end
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
        --  custom_commentstring = function()
        --   if vim.bo.filetype == "kbd" then
        --     return ";; %s"
        --   elseif vim.bo.filetype == "haskell" then
        --     return "-- %s"
        --   else
        --     return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        --   end
        -- end,
      },
    },
  },
}
