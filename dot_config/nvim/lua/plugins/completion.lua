function config()
  vim.o.completeopt = "menuone,noinsert,noselect"
  vim.o.shortmess = vim.o.shortmess .. "c"

  vim.g.completion_customize_lsp_label = {
    Function = '',
    Method = '',
    Reference = '',
    Enum = '',
    Field = 'ﰠ',
    Keyword = '',
    Variable = '',
    Folder = '',
    Snippet = ' ',
    Operator = '',
    Module = '',
    Text = 'ﮜ',
    Buffers = '',
    Class = '',
    Interface = ''
  }

  local utils = require("utils")
  local completion = require("completion")

  vim.api.nvim_set_keymap("i", "<Tab>",   [[pumvisible() ? "\<C-n>" : "\<Tab>"  ]], { expr = true })
  vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

  utils.map("i", "<C-Space>", {silent = true}, completion.triggerCompletion)

  vim.cmd [[autocmd BufEnter * lua require("completion").on_attach()]]
end

return {
  "nvim-lua/completion-nvim",
  config = config,
  requires = {{"hrsh7th/vim-vsnip-integ", requires = {"hrsh7th/vim-vsnip"}}}
}
