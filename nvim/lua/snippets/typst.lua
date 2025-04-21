-- loader for typst snippets

local snippet_modules = {
  "context",
  "fraction",
  "function",
  "matrix",
  "object",
  "set",
  "surround",
  "text",
}

local base_path = "snippets.typst."
local all_snippets = {}

for _, module_name in ipairs(snippet_modules) do
  local module_path = base_path .. module_name
  local success, module_snippets = pcall(require, module_path)

  if success then
    print("Loaded module " .. module_path)
    if type(module_snippets) == "table" then
      for _, snippet in ipairs(module_snippets) do
        table.insert(all_snippets, snippet)
      end
      print("Added " .. #module_snippets .. " snippets from " .. module_path)
    else
      print("Warning: Module " .. module_path .. " did not return a table")
    end
  else
    print("Error loading module: " .. module_path .. " - " .. tostring(module_snippets))
  end
end

print("Loaded " .. #all_snippets .. " snippets")
return all_snippets
