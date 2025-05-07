return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      -- term_colors = true,
      transparent_background = true,
      -- styles = {
      --   comments = {},
      --   conditionals = {},
      --   loops = {},
      --   functions = {},
      --   keywords = {},
      --   strings = {},
      --   variables = {},
      --   numbers = {},
      --   booleans = {},
      --   properties = {},
      --   types = {},
      -- },
      -- color_overrides = {
      --   mocha = {
      --     base = "#000000",
      --     mantle = "#111111",
      --     crust = "#111111",
      --   },
      -- },
      integrations = {
        cmp = true,
        gitsigns = true,
        -- nvimtree = true,
        -- neotree = true,
        snacks = true,
        treesitter = true,
        notify = true,
        telescope = {
          enabled = true,
          -- style = "nvchad",
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
  },
}
