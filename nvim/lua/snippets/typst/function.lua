local common = require("snippets.typst.common")
local get_visual = common.get_visual
local fmt = common.fmt
local fmta = common.fmta
local sm = common.sm
local i = common.i
local d = common.d
local t = common.t

return {

  -- TODO: add ordering snippets eg geq and leq
  sm({ trig = "==", name = "equals aligned" }, fmt([[&= {} \]], { i(1) })),

  sm({ trig = "xx", name = "Cross Product" }, { t("times ") }),

  sm({ trig = "del", name = "Nabla" }, { t("nabla ") }),

  -- sm({ trig = "..", name = "Dot Product", priority = 100 }, { t("dot ") }),

  sm({ trig = "lim", name = "Limit" }, fmt([[lim_({} -> {}) ]], { i(1, "n"), i(2, "infinity") })),

  sm(
    { trig = "sum", name = "Summation (Sigma)" },
    fmt(
      [[
      sum_(n={})^({}) {}
      ]],
      { i(1, "index"), i(2, "infinity"), d(3, get_visual) }
    )
  ),

  -- sm({ trig = "taylor", name = "Taylor series" },
  --   fmt(
  --     [[
  --       sum_({}={})^({}) {}_{} (x-a)^{} {}
  --     ]],
  --     { i(1, "k"), i(2, "0") , i(3, "infinity"), i(4, "c"), rep(1), rep(1), i(0) }
  --   )
  -- ),

  sm(
    { trig = "iint", name = "Integral", priority = 300 },
    fmt(
      [[
      integral_({})^({}) {} {}
      ]],
      { i(1, "-infinity"), i(2, "infinity"), d(3, get_visual), i(0) }
    )
  ),

  sm(
    { trig = "prod", name = "Product (Pi)" },
    fmt(
      [[
      product_({}={})^({}) {} {}
      ]],
      { i(1, "n"), i(2, "1"), i(3, "infinity"), d(4, get_visual), i(0) }
    )
  ),

  sm(
    { trig = "case", name = "Cases, Piecewise" },
    fmt(
      [[
      cases(
          {}
      ) {}
      ]],
      { i(1, "cases here"), i(0) }
    )
  ),

  -- derivatives

  sm({ trig = "part", name = "Partial Derivative" }, fmt([[(diff {})/(diff {}) {}]], { i(1, "f"), i(2, "x"), i(0) })),
  sm({ trig = "pdf", name = "Partial Derivative" }, fmt([[(diff {})/(diff {}) {}]], { i(1, "f"), i(2, "x"), i(0) })),
  sm({ trig = "ddf", name = "Total Derivative" }, fmt([[(d {})/(d {}) {}]], { i(1, "f"), i(2, "x"), i(0) })),
  sm({ trig = "la+", name = "Laplace {Transform}" }, fmta([[cal(L) lr({ <> }) <>]], { i(1), i(0) })),
  sm({ trig = "lap", name = "Laplace (Transform)" }, fmta([[cal(L) lr(( <> )) <>]], { i(1), i(0) })),

  sm({ trig = "ddx", name = "d/dx Total Derivative" }, fmt([[(d {})/(d x) {}]], { i(1, "y"), i(0) })),
  sm({ trig = "pdx", name = "d/dx Partial Derivative" }, fmt([[(diff {})/(diff x) {}]], { i(1, "y"), i(0) })),
  sm({ trig = "ddt", name = "d/dt Total Derivative" }, fmt([[(d {})/(d t) {}]], { i(1, "y"), i(0) })),
  sm({ trig = "pdt", name = "d/dt Partial Derivative" }, fmt([[(diff {})/(diff t) {}]], { i(1, "y"), i(0) })),
}
