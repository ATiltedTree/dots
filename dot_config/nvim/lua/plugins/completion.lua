local M = {}

function M.config()
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

  utils.map("i", "<Tab>", {}, function()
    if vim.fn.pumvisible() == 1 then
      utils.send_keys("<C-n>", false)
    else
      utils.send_keys("<Tab>", true)
    end
  end)
  utils.map("i", "<S-Tab>", {}, function()
    if vim.fn.pumvisible() == 1 then
      utils.send_keys("<C-p>", false)
    else
      utils.send_keys("<S-Tab>", true)
    end
  end)

  utils.map("i", "<C-Space>", {silent = true}, completion.triggerCompletion)

  vim.cmd [[autocmd BufEnter * lua require("completion").on_attach()]]
end

return M
