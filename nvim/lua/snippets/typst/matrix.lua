local common = require("snippets.typst.common")
local postfixm = common.pfm
local fmt = common.fmt
local sm = common.sm
local d = common.d
local i = common.i
local get_visual = common.get_visual

return {
  sm({ trig = "pmat", name = "() Matrix" }, fmt([[mat(delim: "(", {}) {}]], { d(1, get_visual), i(0) })),
  sm({ trig = "bmat", name = "[] Matrix" }, fmt([[mat(delim: "[", {}) {}]], { d(1, get_visual), i(0) })),
}, {}
