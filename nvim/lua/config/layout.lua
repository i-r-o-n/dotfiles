local M = {}

local function is_alpha(char)
  local byte = string.byte(char)
  return (byte >= 65 and byte <= 90) -- 'A' to 'Z'
    or (byte >= 97 and byte <= 122) -- 'a' to 'z'
end

local function unmap(key)
  local modes = { "n", "v", "o", "x" }
  for _, mode in ipairs(modes) do
    vim.api.nvim_del_keymap(mode, key)
  end
end

-- takes default key char and alternate key char and remaps vim binding to both lower and uppercase versions
local function map(alternate_key, default_key)
  local modes = { "n", "v", "o", "x" }
  for _, mode in ipairs(modes) do
    vim.api.nvim_set_keymap(mode, alternate_key, default_key, { noremap = true, silent = true })
  end
end

-- deletes all default key bindings in a pair mappings array
local function unmap_pair_array(key_mappings)
  for _, mapping in ipairs(key_mappings) do
    local key = mapping[2]

    if is_alpha(key) then
      unmap(key:lower())
      unmap(key:upper())
    else
      unmap(key)
    end
  end
end

local function map_pair_array(key_mappings)
  for _, mapping in ipairs(key_mappings) do
    local default_key = mapping[1]
    local alternate_key = mapping[2]

    if is_alpha(default_key) and is_alpha(alternate_key) then
      map(default_key:lower(), alternate_key:lower())
      map(default_key:upper(), alternate_key:upper())
    else
      map(default_key, alternate_key)
    end
  end
end

function M.remap_keys()
  local semimak_mappings = {
    -- { "f", "q" },
    -- { "l", "w" },
    -- { "h", "e" },
    -- { "v", "r" },
    -- { "z", "t" },
    -- { "'", "y" },
    -- { "w", "u" },
    -- { "u", "i" },
    -- --{"o","o"},
    -- { "y", "p" },
    -- { "s", "a" },
    -- { "r", "s" },
    -- { "n", "d" },
    -- { "t", "f" },
    -- { "k", "g" },
    -- { "c", "h" },
    -- { "d", "j" },
    -- { "e", "k" },
    -- { "a", "l" },
    -- { "i", ";" },
    -- { "x", "z" },
    -- { "j", "x" },
    -- { "b", "c" },
    -- { "m", "v" },
    -- { "q", "b" },
    -- { "p", "n" },
    -- { "g", "m" },
    -- --{",",","},
    -- --{".","."},
    -- { ";", "/" },
  }

  local custom_mappings = {
    { "f", "a" },
    { "l", "o" },
    { "h", "s" },
    { "v", "r" },
    { "z", "m" },
    { "'", "/" },
    { "w", "b" },
    { "u", "w" },
    { "o", "e" },
    { "y", "t" },
    { "s", "i" },
    { "r", "c" },
    { "n", "d" },
    { "t", "v" },
    { "k", "." },
    { "c", "h" },
    { "d", "j" },
    { "e", "k" },
    { "a", "l" },
    { "i", "f" },
    { "x", "u" },
    { "j", "x" },
    { "b", "y" },
    { "m", "p" },
    --{"q","q"},
    { "p", "n" },
    --{"g","g"},
    { ",", "z" },
    { ".", "," },
    --{";",";"},
  }

  unmap_pair_array(custom_mappings)
  -- map_pair_array(custom_mappings)
  -- vim.api.nvim_set_keymap("n", "c", "<Left>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("n", "d", "<Down>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("n", "e", "<Up>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("n", "a", "<Right>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("v", "c", "<Left>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("v", "d", "<Down>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("v", "e", "<Up>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("v", "a", "<Right>", { noremap = true, silent = true })
end

return M
