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
  pfm({ trig = ".pr", name = "wrap with ()" }, { l("( " .. l.POSTFIX_MATCH .. " )") }),

  sm({ trig = "lrp", name = "left-right ()" }, fmt([[lr(( {} )) {}]], { d(1, get_visual), i(0) })),
  sm({ trig = "lrb", name = "left-right []" }, fmt([[lr([ {} ]) {}]], { d(1, get_visual), i(0) })),
  sm({ trig = "lrc", name = "left-right {}" }, fmta([[lr({ <> }) <>]], { d(1, get_visual), i(0) })),
  sm({ trig = "lra", name = "left-right <>" }, fmt([[lr(angle.l {} angle.r) {}]], { d(1, get_visual), i(0) })),
  sm({ trig = "lr|", name = "left-right ||" }, fmt([[lr(abs( {} )) {}]], { d(1, get_visual), i(0) })),

  sm({ trig = "mcal", name = "calligraphic variant" }, fmt([[cal({}) {}]], { i(1, "L"), i(0) })),

  -- sm({ trig = "upr", name = "Upright variant for single letters" }, fmt([[upright({}){}]], { d(1, get_visual), i(0) }) ),
}, {
  pfm({ trig = ".up", name = "upright variant for single letters" }, { l("upright(" .. l.POSTFIX_MATCH .. ") ") }),
  sm({ trig = "cl", name = "ceiling function" }, fmt([[ceil({}) {}]], { d(1, get_visual), i(0) })),
  sm({ trig = "fl", name = "floor function" }, fmt([[floor({}) {}]], { d(1, get_visual), i(0) })),
  sm({ trig = "abs", name = "absolute value" }, fmt([[abs({}) {}]], { d(1, get_visual), i(0) })),
  sm({ trig = "rnd", name = "round-up function" }, fmt([[round({}) {}]], { d(1, get_visual), i(0) })),
  sm({ trig = "norm", name = "norm function" }, fmt([[norm({}) {}]], { d(1, get_visual), i(0) })),
}
