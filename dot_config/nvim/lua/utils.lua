local utils = {}

utils.mapping_callbacks = {}

local mapping_buffer = nil

function utils.buffer_map(buffer, callback)
  mapping_buffer = buffer
  callback()
  mapping_buffer = nil
end

function utils.map(mode, binding, opts, callback)
  local sanitized_binding_index = string.format("%s_%s", mode, binding:gsub("<", ""):gsub(">", ""))
  local command = string.format([[<Cmd>lua require("utils").mapping_callbacks["%s"]()<CR>]],
                                sanitized_binding_index)

  if mapping_buffer then
    vim.api.nvim_buf_set_keymap(mapping_buffer, mode, binding, command, opts)
  else
    vim.api.nvim_set_keymap(mode, binding, command, opts)
  end

  utils.mapping_callbacks[sanitized_binding_index] = callback
end

function utils.send_keys(keys, direct)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true),
                        direct and "n" or "m", true)
end

return utils
