local luv = vim.loop

local utils = {}

utils.mapping_callbacks = {}

function utils.map(mode, binding, opts, callback)
  local sanitized_binding_index = string.format("%s_%s", mode, binding:gsub("<", ""):gsub(">", ""))
  local command = string.format([[<Cmd>lua require("utils").mapping_callbacks["%s"]()<CR>]], sanitized_binding_index)

  vim.api.nvim_set_keymap(mode, binding, command, opts)
  utils.mapping_callbacks[sanitized_binding_index] = callback
end

function utils.read_dir(dir)
  local handle = luv.fs_scandir(dir)
  if type(handle) == 'string' then
    vim.api.nvim_err_writeln(handle)
    return {}
  end

  local files = {}
  local dirs = {}

  while true do
    local name, t = luv.fs_scandir_next(handle)
    if not name then break end

    if t == 'file' then
      table.insert(files, name)
    elseif t == 'directory' then
      table.insert(dirs, name)
    end
  end
  return {files = files, dirs = dirs}
end

return utils
