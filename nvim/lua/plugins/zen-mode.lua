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
    },
  },
  { "folke/twilight.nvim" },
}
