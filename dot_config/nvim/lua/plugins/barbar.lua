function config()
  local utils = require("utils")
  local bufferline = vim.g.bufferline

end

return {
  "romgrk/barbar.nvim",
  config = config,
  requires = {{"kyazdani42/nvim-web-devicons"}},
}
