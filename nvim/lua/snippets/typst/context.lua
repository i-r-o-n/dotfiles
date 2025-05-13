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

-- initialize from an array
local ignore_words_array = {
  "unifor",
  "uniform",
  "su",
  "sum",
  "gam",
  "ga",
  "le",
  "lem",
}

local ignore_words = {}

-- convert to hash table
for _, word in ipairs(ignore_words_array) do
  ignore_words[word] = true
end

return {}, {
  sm({ trig = "==", name = "equals aligned" }, fmt([[&= {} \]], { i(1) })),

  --[[
    there are two separate inline math snippet modes 
    haven't decided on the best triggers for them yet 

    - mode 1: use on a completed math expression to wrap in math mode, 
      then insert space afterwards to continue typing non-math content.

    - mode 2: use on an incomplete math expression to wrap in math mode, 
      then place cursor inside of math context to continue entering math content.

  ]]

  s(
    {
      -- trig = "([%a%d][%a%d_]{0,4})ml",
      trig = "([%a%d_]+)ml",
      name = "inline math expression",
      regTrig = true,
      wordTrig = true,
      condition = function(line_to_cursor, matched_trigger, captures)
        -- prevent triggering when typing words which contain substring "ml"
        return not ignore_words[captures[1]]
      end,
    },
    fmt([[${}$ {}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(0),
    })
  ),

  s(
    {
      trig = "([%a%d_]+)mm",
      name = "inline math expression",
      regTrig = true,
      wordTrig = true,
      condition = function(line_to_cursor, matched_trigger, captures)
        -- prevent triggering when typing words which contain substring "mm"
        return not ignore_words[captures[1]]
      end,
    },
    fmt([[${}{}$]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(0),
    })
  ),

  ms(
    {
      { trig = "mm", name = "insert inline math" },
      { trig = "ml", name = "insert inline math" },
    },
    fmt([[${}${}]], {
      i(1),
      i(0),
    })
    -- fmt([[${}${}{} ]], {
    --   i(1),
    --   f(function(args, snip)
    --     if args[1][1] and not string.match(args[1][1], "^[%.,%?%- ]") then
    --       return " "
    --     else
    --       return ""
    --     end
    --   end, { 2 }),
    --   i(2),
    -- })
  ),

  -- display math mode, separating by newlines is personal preference
  -- TODO: add configuration option for newline or just spaces for display math
  s(
    { trig = "dm", name = "Insert block math" },
    fmt(
      [[$ 
{} 
$ {}]],
      { i(1), i(0) }
    )
  ),
}
