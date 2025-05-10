local common = require("snippets.typst.common")

local shorthand = function(trigger, word)
  return common.s({ trig = trigger, name = word .. " shorthand" }, { common.t(word) })
end

return {}, {
  shorthand("holo", "holomorphic"),
}
