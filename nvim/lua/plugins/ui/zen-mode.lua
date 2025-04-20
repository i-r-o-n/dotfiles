local ghostty_integration = require("scripts.ghostty_zen_mode")

return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>uz", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode", mode = { "n", "x", "o" } },
    },
    opts = {
      window = {
        width = 100,
      },
      plugins = {
        kitty = {
          enabled = true,
          font = "+8",
        },
      },
      on_open = function()
        ghostty_integration.toggle_terminal_zen_mode(true)
      end,
      on_close = function()
        ghostty_integration.toggle_terminal_zen_mode(false)
      end,
    },
  },
  { "folke/twilight.nvim" },
}
