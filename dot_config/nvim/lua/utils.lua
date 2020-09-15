local utils = {}

utils.autocmd_callbacks = {}
utils.mapping_callbacks = {}

local charset = {}
do -- [0-9a-zA-Z]
  for c = 48, 57 do table.insert(charset, string.char(c)) end
  for c = 65, 90 do table.insert(charset, string.char(c)) end
  for c = 97, 122 do table.insert(charset, string.char(c)) end
end

-- Generates a random string. Yoinked from https://gist.github.com/haggen/2fd643ea9a261fea2094
utils.randomString = function(length)
  if not length or length <= 0 then return "" end
  math.randomseed(os.clock() ^ 5)
  return utils.randomString(length - 1) .. charset[math.random(1, #charset)]
end

utils.augroup = function(name, clear, callback)
  vim.cmd(string.format("augroup %s", name))
  if clear then vim.cmd("autocmd!") end

  callback()

  vim.cmd("augroup END")
end

utils.autocmd = function(event, pattern, callback)
  local rand_identifier = utils.randomString(5)

  vim.cmd(string.format("autocmd %s %s :lua require(\"utils\").autocmd_callbacks[\"%s\"]()", event,
                        pattern, rand_identifier))

  utils.autocmd_callbacks[rand_identifier] = callback
end

local mapping_in_buffer = false
local mapping_in_buffer_nth = 0

utils.buffer_map = function(buffer, callback)
  mapping_in_buffer = true
  mapping_in_buffer_nth = buffer
  callback()
  mapping_in_buffer_nth = 0
  mapping_in_buffer = false
end

utils.map = function(mode, binding, opts, callback)
  if mapping_in_buffer then

    vim.api.nvim_buf_set_keymap(mapping_in_buffer_nth, mode, binding,
                                string.format(
                                    "<Cmd>lua require(\"utils\").mapping_callbacks[\"%s_%s\"]()<CR>",
                                    mode, binding:gsub("<", ""):gsub(">", "")), opts)
  else
    vim.api.nvim_set_keymap(mode, binding,
                            string.format(
                                "<Cmd>lua require(\"utils\").mapping_callbacks[\"%s_%s\"]()<CR>",
                                mode, binding:gsub("<", ""):gsub(">", "")), opts)

  end
  utils.mapping_callbacks[mode .. "_" .. binding:gsub("<", ""):gsub(">", "")] = callback
end

return utils
