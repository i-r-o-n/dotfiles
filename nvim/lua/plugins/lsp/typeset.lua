return {
  {
    "lervag/vimtex",
    init = function()
      -- Use init for configuration, don't use the more common "config".
    end,
    -- keys = {
    --   { "<localleader>l", desc = "+vimtex" },
    --   {
    --     "<localleader>ll",
    --     desc = "compile",
    --     mode = { "n", "x", "o" },
    --   },
    -- },
  },
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst", -- or lazy = false
    version = "1.*",
    opts = {
      invert_colors = "always",
    }, -- lazy.nvim will implicitly calls `setup {}`
  },
  {
    "kaarmu/typst.vim",
    ft = "typst", -- lazy = false,
    -- FIXME: i don't know is this will work.
    init = function()
      require("lspconfig").tinymist.setup({
        settings = {
          tinymist = {
            formatterMode = "typstyle",
          },
        },
      })
    end,
  },
}
