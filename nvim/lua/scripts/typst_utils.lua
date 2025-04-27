local M = {}

local wk = require("which-key")

local ll = vim.g.maplocalleader or "\\"

M.setup_typst_commands = function()
  -- vim.keymap.set("n", "<localleader>tw", ":call typst#TypstWatch()<CR>", {
  --   noremap = true,
  --   silent = true,
  --   buffer = 0, -- current buffer only
  -- })
  --
  -- vim.keymap.set("n", "<localleader>tp", "<cmd>TypstPreview<CR>", {
  --   noremap = true,
  --   silent = true,
  --   buffer = 0, -- current buffer only
  -- })
  wk.add({
    { ll .. "t", group = "typst" },
    { ll .. "tw", ":call typst#TypstWatch()<CR>", desc = "compile typst file" },
    { ll .. "tp", "<cmd>TypstPreview<CR>", desc = "preview typst file" },
    -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
    -- { "<leader>fb", function() print("hello") end, desc = "Foobar" },
    -- { "<leader>fn", desc = "New File" },
    -- { "<leader>f1", hidden = true }, -- hide this keymap
    -- { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
    -- {
    --   "<leader>b",
    --   group = "buffers",
    --   expand = function()
    --     return require("which-key.extras").expand.buf()
    --   end,
    -- },
    {
      -- Nested mappings are allowed and can be added in any order
      -- Most attributes can be inherited or overridden on any level
      -- There's no limit to the depth of nesting
      -- mode = { "n", "v" }, -- NORMAL and VISUAL mode
      -- { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
      -- { "<leader>w", "<cmd>w<cr>", desc = "Write" },
    },
  })
end

-- require("lspconfig").tinymist.setup({
--   root_dir = function(_, bufnr)
--     return vim.fs.root(bufnr, { ".git" }) or vim.fn.expand("%:p:h")
--   end,
-- })

-- require("lspconfig")["tinymist"].setup({ -- Alternatively, can be used `vim.lsp.config["tinymist"]`
--   root_dir = "-",
--   on_attach = function(client, bufnr)
--     vim.keymap.set("n", "<leader>tp", function()
--       client:exec_cmd({
--         title = "pin",
--         command = "tinymist.pinMain",
--         arguments = { vim.api.nvim_buf_get_name(0) },
--       }, { bufnr = bufnr })
--     end, { desc = "[T]inymist [P]in", noremap = true })
--
--     vim.keymap.set("n", "<leader>tu", function()
--       client:exec_cmd({
--         title = "unpin",
--         command = "tinymist.pinMain",
--         arguments = { vim.v.null },
--       }, { bufnr = bufnr })
--     end, { desc = "[T]inymist [U]npin", noremap = true })
--   end,
-- })

return M
