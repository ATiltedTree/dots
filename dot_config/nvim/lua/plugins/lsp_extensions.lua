function config()
  vim.cmd [[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require("lsp_extensions").inlay_hints({ prefix = "  " })]]
end

return {
  "nvim-lua/lsp_extensions.nvim",
  config = config,
}
