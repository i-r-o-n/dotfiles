return {
  { "tpope/vim-fugitive" },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { -- optional for floating window border decoration
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>gg",
        function()
          Snacks.terminal({ "lazygit" })
        end,
        desc = "LazyGit (cwd)",
      },
      {
        "<leader>gG",
        function()
          Snacks.terminal({ "lazygit" }, { cwd = LazyVim.root.get() })
        end,
        desc = "LazyGit (Root Dir)",
      },
    },
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
  },
}
