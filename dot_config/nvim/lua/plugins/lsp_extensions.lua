local M = {}

function M.config()
  vim.cmd [[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require("lsp_extensions").inlay_hints({ prefix = "  ", highlight = "Comment", enabled = {"ChainingHint"} })]]
end

return M
