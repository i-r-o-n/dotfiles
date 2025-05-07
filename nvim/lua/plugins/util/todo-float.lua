return {
  "a-lipson/todofloat.nvim",
  config = function()
    require("floatingtodo").setup({
      target_file = "~/docs/note/todo.md",
      border = "none",
    })
  end,
  keys = {
    {
      "<leader>;",
      mode = { "n", "v" },
      ":Td<cr>",
      desc = "Open floating task buffer",
    },
  },
}
