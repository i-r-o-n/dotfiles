-- TODO: implement this properly

local coq_fold_expr = function(lnum)
  -- get the current line's content (0-indexed in API, so add 1)
  local line = vim.api.nvim_buf_get_lines(0, lnum - 1, lnum, false)[1]

  -- match any line that starts with a capital letter and has no leading whitespace
  if line:match("^%u") then
    return ">1" -- start a fold at level 1
  end

  -- check for end of definition but is not proof, "Proof."
  if line:match("^%s*%.%s*$") and not line:match("^%s*Proof%.%s*$") then
    return "<1" -- end a fold at level 1
  end

  -- default to maintain current fold level
  return "="
end

_G.coq_fold_expr = coq_fold_expr

-- set up folding for coq files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "coq", "rocq" }, -- Add any other related filetypes
  callback = function()
    -- set fold method to expr
    local win = vim.api.nvim_get_current_win()
    vim.wo[win].foldmethod = "expr"
    -- vim.wo.foldmethod = "expr"

    -- set the fold expression
    vim.wo[win].foldexpr = 'v:lua.coq-folding").coq_fold_expr(' .. "v:lnum" .. ")"

    vim.wo[win].foldnestmax = 3
    vim.wo[win].foldminlines = 2

    -- start with folds open
    vim.wo[win].foldenable = false
  end,
})

return {
  { "whonore/Coqtail" },
}
