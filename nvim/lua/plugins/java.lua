return {
  "nvim-java/nvim-java",
  keys = {
    { "<localleader>j", desc = "+java", mode = { "n", "x", "o" } },
    { "<localleader>jr", "<cmd>JavaRunnerRunMain<CR>", desc = "Run Main", mode = { "n", "x", "o" } },
    { "<localleader>jR", "<cmd>JavaRunnerStopMain<CR>", desc = "Stop Main", mode = { "n", "x", "o" } },
    { "<localleader>jl", "<cmd>JavaRunnerToggleLogs<CR>", desc = "Toggle Logs", mode = { "n", "x", "o" } },
    { "<localleader>jL", "<cmd>JavaRunnerSwitchLogs<CR>", desc = "Switch Logs", mode = { "n", "x", "o" } },
    { "<localleader>jc", "<cmd>JavaDapConfig<CR>", desc = "Configure DAP", mode = { "n", "x", "o" } },
    { "<localleader>jp", "<cmd>JavaProfile<CR>", desc = "Manage Profiles", mode = { "n", "x", "o" } },
    { "<localleader>je", "<cmd>JavaRefactorExtractVariable<CR>", desc = "Extract Variable", mode = { "n", "x", "o" } },
    { "<localleader>jt", desc = "+test", mode = { "n", "x", "o" } },
    { "<localleader>jtr", "<cmd>JavaTestRunCurrentClass<CR>", desc = "Run Current Class", mode = { "n", "x", "o" } },
    { "<localleader>jtR", "<cmd>JavaTestRunCurrentMethod<CR>", desc = "Run Current Method", mode = { "n", "x", "o" } },
    {
      "<localleader>jtd",
      "<cmd>JavaTestDebugCurrentClass<CR>",
      desc = "Debug Current Class",
      mode = { "n", "x", "o" },
    },
    {
      "<localleader>jtD",
      "<cmd>JavaTestDebugCurrentMethod<CR>",
      desc = "Debug Current Method",
      mode = { "n", "x", "o" },
    },
    { "<localleader>jtv", "<cmd>JavaTestViewLastReport<CR>", desc = "View Report", mode = { "n", "x", "o" } },
  },
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-refactor",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    {
      "williamboman/mason.nvim",
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
          "github:mason-org/mason-registry",
        },
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        handlers = {
          ["jdtls"] = function()
            require("java").setup()
          end,
        },
      },
    },
  },
  opts = {},

  -- {
  --   "rcasia/neotest-java",
  --   init = function()
  --     -- override the default keymaps.
  --     -- needed until neotest-java is integrated in LazyVim
  --     local keys = require("lazyvim.plugins.lsp.keymaps").get()
  --     -- run test file
  --     keys[#keys + 1] = {
  --       "<leader>tt",
  --       function()
  --         require("neotest").run.run(vim.fn.expand("%"))
  --       end,
  --       mode = "n",
  --     }
  --     -- run nearest test
  --     keys[#keys + 1] = {
  --       "<leader>tr",
  --       function()
  --         require("neotest").run.run()
  --       end,
  --       mode = "n",
  --     }
  --     -- debug test file
  --     keys[#keys + 1] = {
  --       "<leader>tD",
  --       function()
  --         require("neotest").run.run({ strategy = "dap" })
  --       end,
  --       mode = "n",
  --     }
  --     -- debug nearest test
  --     keys[#keys + 1] = {
  --       "<leader>td",
  --       function()
  --         require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
  --       end,
  --       mode = "n",
  --     }
  --   end,
  -- },
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   opts = {
  --     adapters = {
  --       ["neotest-java"] = {
  --         -- config here
  --       },
  --     },
  --   },
  -- },
}
