local common = require("snippets.typst.common")

local shorthand = function(trigger, word)
  return common.s({ trig = trigger, name = word .. " shorthand" }, { common.t(word) })
end

local math_shorthand = function(trigger, word)
  return common.sm({ trig = trigger, name = word .. " shorthand" }, { common.t(word) })
end

return {}, {
  shorthand("holo", "holomorphic"),
  shorthand("biholo", "biholomorphic"),
  shorthand("cts", "continuous"),
  shorthand("eqcts", "equicontinuous"),
  shorthand("cpct", "compact"),
  shorthand("bdry", "boundary"),
  shorthand("bij", "bijecti"),

  math_shorthand("xif", "hat(f)(xi)"),
  math_shorthand("etpi", "e^(2pi i )"),
  math_shorthand("pii", "2pi i"),
  math_shorthand("eps", "epsilon"),
  math_shorthand("gam", "gamma"),
  math_shorthand("alp", "alpha"),
  math_shorthand("h.5", "#h(0.5em)"),
  math_shorthand("h.25", "#h(0.25em)"),
  math_shorthand("h.1", "#h(1em)"),
}
