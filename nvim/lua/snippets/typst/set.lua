local common = require("snippets.typst.common")
local sm = common.sm
local t = common.t

return {
  sm({ trig = "notin", name = "not in" }, { t("in.not ") }),
  sm({ trig = "OO", name = "empty set" }, { t("emptyset ") }),
}, {
  sm({ trig = "wot", name = "without", hidden = true }, { t("without ") }),
  sm({ trig = "nin", name = "not in", hidden = true }, { t("in.not ") }),
  sm({ trig = "cc", name = "subset", hidden = true }, { t("subset ") }),
}
