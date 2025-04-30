local common = require("snippets.typst.common")
local pfm = common.pfm
local fmt = common.fmt
local sm = common.sm
local sn = common.sn
local d = common.d
local f = common.f
local i = common.i
local l = common.l
local get_visual = common.get_visual

return {}, {

  -- sm(
  --   { trig = "/", name = "Fraction Num", dscr = "Creates a fraction with selection as numerator." },
  --   fmt("({})/({}) {}", {
  --     -- f(function(_, snip)
  --     --   local res, env = {}, snip.env
  --     --   for _, val in ipairs(env.LS_SELECT_RAW) do
  --     --     table.insert(res, val)
  --     --   end
  --     --   return res
  --     -- end, {}),
  --     d(1, get_visual),
  --     i(2, "den"),
  --     i(0),
  --   })
  -- ),

  -- sm(
  --   { trig = "\\", name = "Fraction Den", dscr = "Creates a fraction with selection as denominator." },
  --   fmt("({})/({}) {}", {
  --     i(2, "num"),
  --     d(1, get_visual),
  --     i(0),
  --   })
  -- ),

  -- postfixm(
  --   { trig = ".fr", name = "Surround into fraction" },
  --   fmt([[{}/({}) {}]], {
  --     d(1, function(_, parent)
  --       return sn(nil, { t("(" .. parent.env.POSTFIX_MATCH .. ")") })
  --     end),
  --     i(2, "den"),
  --     i(0),
  --   })
  -- ),

  sm(
    {
      trig = "([%a%d])di",
      name = "fraction single character numerator",
      regTrig = true,
      wordTrig = true,
      priority = 1000,
    },
    fmt([[{}/({})]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(0),
    })
  ),

  sm(
    {
      trig = "([%a%d_%+%-()]+)di",
      -- trig = "([^%s]+)di",
      name = "fraction",
      regTrig = true,
      wordTrig = true,
      priority = 100,
    },
    fmt([[{}/({})]], {
      f(function(_, snip)
        local capture = snip.captures[1]
        if capture:sub(1, 1) == "(" and capture:sub(-1) == ")" then
          return capture
        else
          return "(" .. capture .. ")"
        end
      end),
      i(0),
    })
  ),

  pfm(
    { trig = "fr", name = "surround into fraction" },
    fmt("{}/({}) {}", {
      l("(" .. l.POSTFIX_MATCH .. ")"),
      i(1),
      i(0),
    })
  ),
}
