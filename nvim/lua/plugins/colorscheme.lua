-- return {
--   -- { "marko-cerovac/material.nvim" },
--   {
--     "projekt0n/github-nvim-theme",
--     lazy = false,
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "github_dark_default",
--     },
--   },
-- }
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
      term_colors = true,
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
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        neotree = true,
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
