return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    -- if LazyVim.has("noice.nvim") then
    --   opts.defaults["<leader>sn"] = { name = "+noice" }
    -- end

    local which_key = require("which-key")

    which_key.register({
      ["\\"] = {
        u = {
          name = "+ultisnips",
          r = { "<cmd>call UltiSnips#RefreshSnippets()<CR>", "Refresh UltiSnips" },
        },
        l = {
          name = "+vimtex",
        },
      },
    }, { mode = "n" })
  end,
}
