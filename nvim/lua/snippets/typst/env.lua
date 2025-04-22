local common = require("snippets.typst.common")
local fmt = common.fmt
local fmta = common.fmta
local sb = common.sb
local i = common.i
local d = common.d
local get_visual = common.get_visual

return {
  sb(
    { trig = "proof", name = "Proof" },
    fmt(
      [[
      #proof[
      {}
      ]
      ]],
      { i(0) }
    )
  ),

  sb(
    { trig = "prob", name = "Problem" },
    fmt(
      [[
      #problem[
      {}
      ]
      ]],
      { i(0) }
    )
  ),

  -- sb(
  --   { trig = "figt", name = "Insert table figure" },
  --   fmt(
  --     [[
  --   figure(
  --     table(
  --       columns: ({}),
  --       align: ({}),
  --       {}
  --     ),
  --     caption: [{}],
  --   ) <ftbl-{}>{}]],
  --     {
  --       i(3, "auto"),
  --       i(4, "center"),
  --       i(5, "content"),
  --       i(1, "caption"),
  --       i(2, "label"),
  --       i(0),
  --     }
  --   )
  -- ),
  --
  -- sb(
  --   { trig = "figi", name = "Insert image figure" },
  --   fmt(
  --     [[
  --   figure(
  --     image("{}", width: {}, height: {}),
  --     caption: [{}],
  --   ) <fimg-{}>{}]],
  --     {
  --       i(5, "href"),
  --       i(3, "auto"),
  --       i(4, "auto"),
  --       i(1, "caption"),
  --       i(2, "label"),
  --       i(0),
  --     }
  --   )
  -- ),
  --
  -- sb(
  --   { trig = "figc", name = "Insert code figure" },
  --   fmt(
  --     [[
  --   figure(
  --     caption: [{}],
  --   )[
  --   ```{}
  --   {}
  --   ```
  --   ] <fcode-{}>{}]],
  --     {
  --       i(1, "caption"),
  --       i(3, "lang"),
  --       i(4, "code"),
  --       i(2, "label"),
  --       i(0),
  --     }
  --   )
  -- ),
  --
  -- sb(
  --   { trig = "tl", name = "Insert term list item" },
  --   fmt(
  --     [[
  --   / {}: {}
  --   {}]],
  --     { i(1, "term"), i(2, "description"), i(0) }
  --   )
  -- ),
  --
  -- -- Callouts / Admonitions / Boxes
  -- sb(
  --   { trig = "defa", name = "Admonition: Defintion" },
  --   fmta(
  --     [[
  --     #definition(
  --       "<>",
  --       footer: [<>]
  --     )[
  --       <>
  --     ]
  --
  --     <>]],
  --     {
  --       i(1, "title"),
  --       i(2, "footer text"),
  --       d(3, get_visual),
  --       i(0),
  --     }
  --   )
  -- ),
  --
  -- sb(
  --   { trig = "exma", name = "Admonition: Example" },
  --   fmta(
  --     [[
  --     #example(
  --       "<>",
  --       footer: [<>]
  --     )[
  --       <>
  --     ]
  --
  --     <>]],
  --     {
  --       i(1, "title"),
  --       i(2, "footer text"),
  --       d(3, get_visual),
  --       i(0),
  --     }
  --   )
  -- ),
  --
  -- sb(
  --   { trig = "nota", name = "Admonition: Note" },
  --   fmta(
  --     [[
  --     #note(
  --       "<>",
  --       footer: [<>]
  --     )[
  --       <>
  --     ]
  --
  --     <>]],
  --     {
  --       i(1, "title"),
  --       i(2, "footer text"),
  --       d(3, get_visual),
  --       i(0),
  --     }
  --   )
  -- ),
  --
  -- sb(
  --   { trig = "atta", name = "Admonition: Attention" },
  --   fmta(
  --     [[
  --     #attention(
  --       "<>",
  --       footer: [<>]
  --     )[
  --       <>
  --     ]
  --
  --     <>]],
  --     {
  --       i(1, "title"),
  --       i(2, "footer text"),
  --       d(3, get_visual),
  --       i(0),
  --     }
  --   )
  -- ),
  --
  -- sb(
  --   { trig = "qta", name = "Admonition: Quote" },
  --   fmta(
  --     [[
  --     #quote(
  --       "<>",
  --       footer: [<>]
  --     )[
  --       <>
  --     ]
  --
  --     <>]],
  --     {
  --       i(1, "title"),
  --       i(2, "footer text"),
  --       d(3, get_visual),
  --       i(0),
  --     }
  --   )
  -- ),
  --
  -- sb(
  --   { trig = "thma", name = "Admonition: Theorem" },
  --   fmta(
  --     [[
  --     #theorem(
  --       "<>",
  --       footer: [<>]
  --     )[
  --       <>
  --     ]
  --
  --     <>]],
  --     {
  --       i(1, "title"),
  --       i(2, "footer text"),
  --       d(3, get_visual),
  --       i(0),
  --     }
  --   )
  -- ),
  --
  -- sb(
  --   { trig = "propa", name = "Admonition: Proposition" },
  --   fmta(
  --     [[
  --     #proposition(
  --       "<>",
  --       footer: [<>]
  --     )[
  --       <>
  --     ]
  --
  --     <>]],
  --     {
  --       i(1, "title"),
  --       i(2, "footer text"),
  --       d(3, get_visual),
  --       i(0),
  --     }
  --   )
  -- ),
}
