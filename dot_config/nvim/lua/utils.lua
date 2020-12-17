local utils = {}

utils.mapping_callbacks = {}

function utils.map(mode, binding, opts, callback)
  local sanitized_binding_index = string.format("%s_%s", mode, binding:gsub("<", ""):gsub(">", ""))
  local command = string.format([[<Cmd>lua require("utils").mapping_callbacks["%s"]()<CR>]], sanitized_binding_index)

  vim.api.nvim_set_keymap(mode, binding, command, opts)
  utils.mapping_callbacks[sanitized_binding_index] = callback
end

return utils
