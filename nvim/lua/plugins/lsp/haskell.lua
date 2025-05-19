-- local ht = require("haskell-tools")
-- local bufnr = vim.api.nvim_get_current_buf()
-- local opts = { noremap = true, silent = true, buffer = bufnr }
-- -- haskell-language-server relies heavily on codeLenses,
-- -- so auto-refresh (see advanced configuration) is enabled by default
-- vim.keymap.set("n", "<space>cl", vim.lsp.codelens.run, opts)
-- -- Hoogle search for the type signature of the definition under the cursor
-- vim.keymap.set("n", "<space>hs", ht.hoogle.hoogle_signature, opts)
-- -- Evaluate all code snippets
-- vim.keymap.set("n", "<space>ea", ht.lsp.buf_eval_all, opts)
-- -- Toggle a GHCi repl for the current package
-- vim.keymap.set("n", "<leader>rr", ht.repl.toggle, opts)
-- -- Toggle a GHCi repl for the current buffer
-- vim.keymap.set("n", "<leader>rf", function()
--   ht.repl.toggle(vim.api.nvim_buf_get_name(0))
-- end, opts)
-- vim.keymap.set("n", "<leader>rq", ht.repl.quit, opts)

-- require("lspconfig").hls.setup({
--   filetypes = { "haskell", "lhaskell", "cabal" },
--   settings = {
--     haskell = {
--       -- formattingProvider = "stylish-haskell",
--       checkProject = true,
--       formattingProvider = "ormolu",
--       plugin = {
--         ghcide = {
--           -- Automatically add type annotations
--           type_lenses = {
--             enabled = true,
--             globalOn = true, -- Show type lenses everywhere
--           },
--         },
--       },
--     },
--   },
-- })

-- require("iron.core").setup({
--   config = {
--     repl_definition = {
--       haskell = {
--         command = function(meta)
--           local file = vim.api.nvim_buf_get_name(meta.current_bufnr)
--           -- call `require` in case iron is set up before haskell-tools
--           return require("haskell-tools").repl.mk_repl_cmd(file)
--         end,
--       },
--     },
--   },
-- })

return {
  { "nbouscal/vim-stylish-haskell" },
  { "alx741/vim-hindent" },
  -- { "neovimhaskell/haskell-vim" },
  --   {
  --     "mrcjkb/haskell-tools.nvim",
  --     version = "^4",
  --     lazy = false,
  --     keys = {
  --       "<leader>chs",
  --       -- ht.hoogle.hoogle_signature,
  --       desc = "Run codelens",
  --       mode = { "n" },
  --     },
  --   },
  { "Vigemus/iron.nvim" }, -- repl
  { "kevinhwang91/nvim-ufo" }, -- folding
  {
    "isovector/cornelis",
    name = "cornelis",
    ft = "agda",
    build = "stack install",
    dependencies = { "neovimhaskell/nvim-hs.vim", "kana/vim-textobj-user" },
    version = "v2.6.*",
  },
}
