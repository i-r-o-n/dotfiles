return {
  { "SirVer/ultisnips" },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    -- lazy = true,
    -- enabled = function()
    --   return vim.bo.filetype ~= "tex" -- disable for tex files
    -- end,
    -- keys = function()
    --   return {}
    -- end,
  },
  -- { "quangnguyen30192/cmp-nvim-ultisnips" },
  {
    "a-lipson/cmp-nvim-ultisnips",
    keys = {
      { "<localleader>u", desc = "+ultisnips" },
      {
        "<localleader>ur",
        "<cmd>call UltiSnips#RefreshSnippets()<CR>",
        desc = "Refresh UltiSnips",
        mode = { "n", "x", "o" },
      },
    },
  },
  -- { "saadparwaiz1/cmp_luasnip" },
  -- { "micangl/cmp-vimtex" },
  -- TODO: disable Luasnip in tex tiletype buffers
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      -- opts.sources = opts.sources or {}
      -- table.insert(opts.sources, { name = "crates" })
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local ultisnips = require("cmp_nvim_ultisnips.mappings")

      -- check if LuaSnip should be used based on buffer file type
      local use_luasnip = vim.bo.filetype ~= "tex"
      local luasnip = use_luasnip and require("luasnip") or nil

      cmp.setup({
        snippet = {
          expand = function(args)
            if luasnip then
              luasnip.lsp_expand(args.body)
            end
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
      })

      local function ultisnip_can_expand_or_jump()
        return vim.api.nvim_call_function("UltiSnips#CanExpandSnippet", {}) == 1
          or vim.api.nvim_call_function("UltiSnips#CanJumpForwards", {}) == 1
      end

      local function ultisnip_can_jump_back()
        return vim.api.nvim_call_function("UltiSnips#CanJumpBackwards", {}) == 1
      end

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif ultisnip_can_expand_or_jump() then
            ultisnips.expand_or_jump_forwards(fallback)
          elseif luasnip and luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif ultisnip_can_jump_back() then
            ultisnips.jump_backwards(fallback)
          elseif luasnip and luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
