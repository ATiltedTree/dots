function config()
  local utils = require("utils")
  
  vim.api.nvim_set_keymap("n", "<C-PageDown>", [[:BufferNext<CR>]], {})
  vim.api.nvim_set_keymap("n", "<C-PageUp>", [[:BufferPrevious<CR>]], {})
end

return {
  "romgrk/barbar.nvim",
  config = config,
  requires = {{"kyazdani42/nvim-web-devicons"}},
}
