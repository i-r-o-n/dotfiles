local common = require("snippets.typst.common")
local sm = common.sm
local t = common.t

return {
  sm({ trig = "notin", name = "Not In" }, { t("in.not ") }),
  sm({ trig = "OO", name = "Empty Set" }, { t("emptyset ") }),
}
