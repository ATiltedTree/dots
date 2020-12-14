local M = {}

function M.config()
  local lspconfig = require("lspconfig")
  local utils = require("utils")

  lspconfig.rust_analyzer.setup({})

  utils.map("n", "<space>cd", {silent = true}, vim.lsp.buf.definition)
  utils.map("n", "<space>ci", {silent = true}, vim.lsp.buf.implementation)
  utils.map("n", "<space>ct", {silent = true}, vim.lsp.buf.type_definition)
  utils.map("n", "<space>cD", {silent = true}, vim.lsp.buf.references)

  utils.map("n", "K", {silent = true}, vim.lsp.buf.hover)
  utils.map("n", "<space>cf", {silent = true}, vim.lsp.buf.formatting)
  utils.map("n", "<space>cr", {silent = true}, vim.lsp.buf.rename)
  utils.map("n", "<space>ca", {silent = true}, vim.lsp.buf.code_action)

  vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
end

return M
