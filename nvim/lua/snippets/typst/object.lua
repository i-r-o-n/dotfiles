local common = require("snippets.typst.common")
local pfm = common.pfm
local fmt = common.fmt
local sm = common.sm
local sn = common.sn
local d = common.d
local i = common.i
local f = common.f
local l = common.l
local t = common.t
local rep = common.rep
local get_visual = common.get_visual

return {
  -- confirmation snippets
  sm({ trig = "conj", name = "Conjugate" }, fmt([[overline({}){}]], { d(1, get_visual), i(0) })),
  sm({ trig = "bar", name = "Over: bar" }, fmt([[overline({}){}]], { d(1, get_visual), i(0) })),
}, {
  -- automatic snippets
  sm(
    {
      trig = "(%a)(%d)",
      regTrig = true,
      name = "Auto-subscript 1D",
      dscr = "Auto-subscript with 1 digit",
    },
    fmt([[{}_{}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    })
  ),

  sm(
    { trig = "(%a)_(%d%d)", regTrig = true, name = "Auto-subscript 2D", dscr = "Auto-subscript for 2 digits" },
    fmt([[{}_({})]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    })
  ),

  sm(
    { trig = "(%a)_(%d%d)", regTrig = true, name = "Auto-subscript 2D", dscr = "auto subscript for 2+ digits" },
    fmt([[{}_({})]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    })
  ),

  pfm(
    { trig = ".ts", name = "Text Subscript" },
    fmt([[{}_("{}") {}]], {
      d(1, function(_, parent)
        return sn(nil, { t("(" .. parent.env.POSTFIX_MATCH .. ")") })
      end),
      i(2, "subscript"),
      i(0),
    })
  ),

  sm({ trig = "__", name = "Subscript", wordTrig = false }, fmt([[({})_{} {}]], { d(1, get_visual), i(2), i(0) })),
  sm({ trig = "xnn", name = "x_n", wordTrig = false }, { t("x_n") }),
  sm({ trig = "ynn", name = "y_n", wordTrig = false }, { t("y_n") }),
  sm({ trig = "xmm", name = "x_m", wordTrig = false }, { t("x_m") }),
  sm({ trig = "ymm", name = "y_m", wordTrig = false }, { t("y_m") }),
  sm({ trig = "xii", name = "x_i", wordTrig = false }, { t("x_i") }),
  sm({ trig = "yii", name = "y_i", wordTrig = false }, { t("y_i") }),
  sm({ trig = "xjj", name = "x_j", wordTrig = false }, { t("x_j") }),
  sm({ trig = "yjj", name = "y_j", wordTrig = false }, { t("y_j") }),

  sm({ trig = "xp1", name = "x_(n+1)", wordTrig = false }, { t("x_(n+1)") }),

  sm({ trig = "sr", name = "(V) Square Root" }, fmt([[sqrt({}) {}]], { d(1, get_visual), i(0) })),

  pfm({ trig = ".sr", name = "(W) Square Root", priority = 1001 }, { l("sqrt(" .. l.POSTFIX_MATCH .. ") ") }),

  sm({ trig = "inv", name = "Inverse (^-1)", wordTrig = false }, { t("^(-1)") }),
  sm({ trig = "sq", name = "Squared (^2)", wordTrig = false }, { t("^2") }),
  sm({ trig = "cb", name = "Cubed (^3)", wordTrig = false }, { t("^3") }),
  sm(
    { trig = "td", name = "To the Power of {exponent}", wordTrig = false },
    fmt([[({})^{} {}]], { d(1, get_visual), i(2), i(0) })
  ),

  sm({ trig = "compl", name = "Complement (^complement)", wordTrig = false }, { t("^complement") }),

  sm({ trig = "hbar", name = "hbar" }, { t("planck.reduce") }),

  sm(
    { trig = "(%a)bar", name = "Letter bars", regTrig = true },
    fmt([[overline({}) ]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
    })
  ),

  sm(
    { trig = "(%a)hat", name = "Letter hats", regTrig = true },
    fmt([[hat({}) ]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
    })
  ),

  sm(
    { trig = "(%a),.", name = "Vectors", regTrig = true },
    fmt([[arrow({}) ]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
    })
  ),

  sm(
    { trig = "(%a).,", name = "Vectors", regTrig = true },
    fmt([[arrow({}) ]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
    })
  ),

  sm(
    { trig = "cvec", name = "Column Vector" },
    fmt([[vec({}_{}, dots.v, {}_{})]], { i(1, "x"), i(2, "1"), rep(1), i(3, "n") })
  ),

  sm({ trig = "...", name = "ldots", priority = 100 }, { t("#sym.dots.h") }),
  sm({ trig = "tt", name = "Text" }, fmt([["{}" {}]], { i(1, "text here"), i(0) })),
}
