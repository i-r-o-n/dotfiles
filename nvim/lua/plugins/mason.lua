return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = {} -- This will clear the ensure_installed list
      return opts
    end,
  },
}
