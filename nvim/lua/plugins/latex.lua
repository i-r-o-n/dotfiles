return {
  {
    "lervag/vimtex",
    init = function()
      -- Use init for configuration, don't use the more common "config".
    end,
    keys = {
      { "<localleader>l", desc = "+vimtex" },
      {
        "<localleader>ll",
        desc = "compile",
        mode = { "n", "x", "o" },
      },
    },
  },
}
