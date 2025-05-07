return {
  {
    "folke/which-key.nvim",
    opts = {
      win = {
        border = "none",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jvgrootveld/telescope-zoxide",
    },
    opts = {
      defaults = {
        border = false,
      },
    },
  },
}
