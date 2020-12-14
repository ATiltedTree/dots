local M = {}

function M.config()

  local utils = require("utils")

  utils.map("n", "<C-PageDown>", {}, function()
    utils.send_keys(":BufferNext<CR>",false)
  end)
  utils.map("n", "<C-PageUp>", {}, function()
    utils.send_keys(":BufferPrevious<CR>",false)
  end)
end

return M
