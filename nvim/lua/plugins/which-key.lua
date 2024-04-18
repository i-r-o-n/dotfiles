return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    -- if LazyVim.has("noice.nvim") then
    --   opts.defaults["<leader>sn"] = { name = "+noice" }
    -- end

    local which_key = require("which-key")

    which_key.register({
      u = {
        z = { "<cmd>ZenMode<CR>", "Toggle Zen Mode" }, -- New keybinding for Zen Mode
      },
    }, { prefix = "<leader>" })

    which_key.register({
      u = {
        name = "+ultisnips",
        r = { "<cmd>call UltiSnips#RefreshSnippets()<CR>", "Refresh UltiSnips" },
      },
      l = {
        name = "+vimtex",
        l = "compile",
      },
    }, { mode = "n", prefix = "<localleader>" })
  end,
}
