local dap = require("dap")
dap.adapters.ocamlearlybird = {
  type = "executable",
  command = "ocamlearlybird",
  args = { "debug" },
}

local function find_ocaml_exe()
  -- Look for .exe files in _build/default/src, excluding test runners
  -- local handle = io.popen('find _build/default/src -maxdepth 1 -name "*.exe" ! -name "*test*"')
  local handle = io.popen('find _build/default/src -maxdepth 1 -name "*.bc" ! -name "*test*"')
  local result = handle:read("*a")
  handle:close()
  -- Remove trailing whitespace/newline
  result = result:gsub("%s+$", "")
  return result
end

dap.configurations.ocaml = {
  {
    type = "ocamlearlybird",
    name = "OCaml Debug",
    request = "launch",
    program = "${workspaceFolder}/" .. find_ocaml_exe(),
  },
}

return {}
