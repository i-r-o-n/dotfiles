local M = {}

local ls = require("luasnip")
local extras = require("luasnip.extras")
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")

M.s = ls.snippet
M.sn = ls.snippet_node
M.isn = ls.indent_snippet_node
M.t = ls.text_node
M.i = ls.insert_node
M.f = ls.function_node
M.c = ls.choice_node
M.d = ls.dynamic_node
M.r = ls.restore_node
M.ms = ls.multi_snippet

M.fmt = require("luasnip.extras.fmt").fmt
M.fmta = require("luasnip.extras.fmt").fmta

local extdec = ls.extend_decorator
M.l = extras.lambda
M.rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda

local conds = require("luasnip.extras.expand_conditions")
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local k = require("luasnip.nodes.key_indexer").new_key

-- When `LS_SELECT_RAW` is populated with a visual selection, this function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
M.get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return M.sn(nil, M.i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return M.sn(nil, M.i(1))
  end
end

-- Typst context detection

function M.in_markup()
  return vim.api.nvim_eval("typst#in_markup()") == 1
end

function M.in_math()
  return vim.api.nvim_eval("typst#in_math()") == 1
end

function M.in_code()
  return vim.api.nvim_eval("typst#in_code()") == 1
end

function M.in_comment()
  return vim.api.nvim_eval("typst#in_comment()") == 1
end

-- returns either a space or an empty string based on the input
function M.space_conditional(args)
  -- args[1] will be the text from the first node
  local next_char = args[1]
  if next_char and not string.match(next_char, "[,%.%?%- ]") then
    return " "
  else
    return ""
  end
end

-- use LuaSnip's extend decorator to set
local math_opts = { condition = M.in_math, show_condition = M.in_math }
extdec.register(M.s, { arg_indx = 3 })
extdec.register(M.ms, { arg_indx = 3 })
extdec.register(postfix, { arg_indx = 3 })

-- M.pfms = extdec.apply(function(trig, nodes, opts)
--   return postfix(trig, function(opts)
--     return M.c(1, nodes)
--   end, opts)
-- end, { condition = M.in_math, show_condition = M.in_math })

-- math mode context
M.sm = extdec.apply(M.s, { condition = M.in_math, show_condition = M.in_math })
-- math mode context multi trigger
M.smm = extdec.apply(ls.multi_snippet, { condition = M.in_math, show_condition = M.in_math })
-- line beginning
M.sb = extdec.apply(M.s, { condition = line_begin })
-- postfix math mode
M.pfm = extdec.apply(postfix, { condition = M.in_math, show_condition = M.in_math })

-- matching regex patterns

M.math_expr_pattern = "([%a%d_%+%-()]+)"

M.word = ""

return M
