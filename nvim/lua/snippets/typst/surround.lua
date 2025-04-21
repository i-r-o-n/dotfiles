local common = require("snippets.typst.common")
local fmt = common.fmt
local fmta = common.fmta
local pfm = common.pfm
local get_visual = common.get_visual
local sm = common.sm
local i = common.i
local d = common.d
local l = common.l

return {
  pfm({ trig = ".pr", name = "Wrap with ()" }, { l("( " .. l.POSTFIX_MATCH .. " )") }),

  sm({ trig = "lrp", name = "Left-Right ()" }, fmt([[lr(( {} )) {}]], { d(1, get_visual), i(0) })),
  sm({ trig = "lrb", name = "Left-Right []" }, fmt([[lr([ {} ]) {}]], { d(1, get_visual), i(0) })),
  sm({ trig = "lrc", name = "Left-Right {}" }, fmta([[lr({ <> }) <>]], { d(1, get_visual), i(0) })),
  sm({ trig = "lra", name = "Left-Right <>" }, fmt([[lr(angle.l {} angle.r) {}]], { d(1, get_visual), i(0) })),
  sm({ trig = "lr|", name = "Left-Right ||" }, fmt([[lr(abs( {} )) {}]], { d(1, get_visual), i(0) })),

  sm({ trig = "mcal", name = "Calligraphic variant" }, fmt([[cal({}) {}]], { i(1, "L"), i(0) })),

  -- sm({ trig = "upr", name = "Upright variant for single letters" }, fmt([[upright({}){}]], { d(1, get_visual), i(0) }) ),
  pfm(
    { trig = ".up", snippetType = "autosnippet", name = "Upright variant for single letters" },
    { l("upright(" .. l.POSTFIX_MATCH .. ") ") }
  ),
  sm(
    { trig = "cl", snippetType = "autosnippet", name = "Ceiling function" },
    fmt([[ceil({}) {}]], { d(1, get_visual), i(0) })
  ),
  sm(
    { trig = "fl", snippetType = "autosnippet", name = "Floor function" },
    fmt([[floor({}) {}]], { d(1, get_visual), i(0) })
  ),
  sm(
    { trig = "abs", snippetType = "autosnippet", name = "Absolute value" },
    fmt([[abs({}) {}]], { d(1, get_visual), i(0) })
  ),
  sm(
    { trig = "rnd", snippetType = "autosnippet", name = "Round-up function" },
    fmt([[round({}) {}]], { d(1, get_visual), i(0) })
  ),
  sm(
    { trig = "norm", snippetType = "autosnippet", name = "Norm function" },
    fmt([[norm({}) {}]], { d(1, get_visual), i(0) })
  ),
}
