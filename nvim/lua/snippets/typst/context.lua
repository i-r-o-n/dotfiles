local common = require("snippets.typst.common")
local postfixm = common.pfm
local fmt = common.fmt
local s = common.s
local ms = common.ms
local sm = common.sm
local sn = common.sn
local d = common.d
local i = common.i
local f = common.f
local t = common.t
local get_visual = common.get_visual

return {
  s(
    { trig = "dm", name = "Insert block math", snippetType = "autosnippet" },
    fmt(
      [[
    $ {} $

    {}]],
      { i(1), i(0) }
    )
  ),

  ms(
    {
      { trig = "mm", name = "Insert inline math", snippetType = "autosnippet" },
      { trig = "ml", name = "Insert inline math", snippetType = "autosnippet" },
    },
    fmt([[${}${}{} ]], {
      i(1),
      f(function(args, snip)
        if args[1][1] and not string.match(args[1][1], "^[%.,%?%- ]") then
          return " "
        else
          return ""
        end
      end, { 2 }),
      i(2),
    })
  ),
}
