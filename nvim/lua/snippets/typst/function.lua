local common = require("snippets.typst.common")
local get_visual = common.get_visual
local fmt = common.fmt
local fmta = common.fmta
local pfm = common.pfm
local sm = common.sm
local i = common.i
local d = common.d
local l = common.l
local t = common.t

return {

  sm(
    { trig = "prod", name = "product" },
    fmt(
      [[
      product_({}={})^({}) {} {}
      ]],
      { i(1, "n"), i(2, "1"), i(3, "infinity"), d(4, get_visual), i(0) }
    )
  ),
}, {

  -- TODO: add ordering snippets eg geq and leq

  sm({ trig = "xx", name = "cross product" }, { t("times ") }),

  -- sm({ trig = "..", name = "Dot Product", priority = 100 }, { t("dot ") }),

  sm({ trig = "mto", name = "maps to" }, { t("mapsto ") }),

  sm(
    { trig = "lim", name = "limit" },
    fmt(
      [[
      lim_({} -> {}) 
      ]],
      { i(1, "n"), i(2, "infinity") }
    )
  ),

  sm(
    { trig = "sum", name = "summation" },
    fmt(
      [[
      sum_({})^({}) {}
      ]],
      { i(1, "n=0"), i(2, "infinity"), d(3, get_visual) }
    )
  ),

  sm({ trig = "inv", name = "inverse (^-1)", wordTrig = false }, { t("^(-1)") }),

  sm({ trig = "sq", name = "square root" }, fmt([[sqrt({}) {}]], { d(1, get_visual), i(0) })),
  pfm({ trig = "sq", name = "square root", priority = 1001 }, { l("sqrt(" .. l.POSTFIX_MATCH .. ") ") }),
  sm({ trig = "sr", name = "squared", wordTrig = false }, { t("^2") }),
  sm({ trig = "cb", name = "cubed", wordTrig = false }, { t("^3") }),

  -- sm({ trig = "taylor", name = "Taylor series" },
  --   fmt(
  --     [[
  --       sum_({}={})^({}) {}_{} (x-a)^{} {}
  --     ]],
  --     { i(1, "k"), i(2, "0") , i(3, "infinity"), i(4, "c"), rep(1), rep(1), i(0) }
  --   )
  -- ),

  sm(
    { trig = "iint", name = "integral", priority = 300 },
    fmt(
      [[
      integral_({})^({}) {} {}
      ]],
      { i(1, "-infinity"), i(2, "infinity"), d(3, get_visual), i(0) }
    )
  ),

  sm(
    { trig = "dint", name = "integral", priority = 300 },
    fmt(
      [[
      integral_({})^({}) {} {}
      ]],
      { i(1, "a"), i(2, "b"), d(3, get_visual), i(0) }
    )
  ),

  -- derivatives
  sm({ trig = "part", name = "partial derivative" }, fmt([[(diff {})/(diff {}) {}]], { i(1, "f"), i(2, "x"), i(0) })),
  sm({ trig = "pdf", name = "partial derivative" }, fmt([[(diff {})/(diff {}) {}]], { i(1, "f"), i(2, "x"), i(0) })),
  sm({ trig = "ddf", name = "total derivative" }, fmt([[(d {})/(d {}) {}]], { i(1, "f"), i(2, "x"), i(0) })),
  sm({ trig = "lap", name = "laplace (transform)" }, fmta([[cal(L) lr(( <> )) <>]], { i(1), i(0) })),

  -- TODO: expand to general derative variable
  sm({ trig = "ddx", name = "d/dx total derivative" }, fmt([[(d {})/(d x) {}]], { i(1, "y"), i(0) })),
  sm({ trig = "pdx", name = "d/dx partial derivative" }, fmt([[(diff {})/(diff x) {}]], { i(1, "y"), i(0) })),
  sm({ trig = "ddt", name = "d/dt total derivative" }, fmt([[(d {})/(d t) {}]], { i(1, "y"), i(0) })),
  sm({ trig = "pdt", name = "d/dt partial derivative" }, fmt([[(diff {})/(diff t) {}]], { i(1, "y"), i(0) })),
}
