function config()
  local utils = require("utils")

  require("bufferline").setup({
    options = {
      diagnostics = "nvim_lsp",
      separator_style = "thin",
    }
  })

  vim.api.nvim_set_keymap("n", "<C-PageDown>", [[:BufferLineCycleNext<CR>]], {})
  vim.api.nvim_set_keymap("n", "<C-PageUp>",   [[:BufferLineCyclePrev<CR>]], {})
end

return {
  "akinsho/nvim-bufferline.lua",
  config = config,
  requires = {{"kyazdani42/nvim-web-devicons"}},
}
