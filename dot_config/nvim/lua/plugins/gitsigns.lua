function config()
  require("gitsigns").setup({
    signs = {
      add          = {hl = 'GitGutterAdd'   , text = '▎'},
      change       = {hl = 'GitGutterChange', text = '▎'},
      delete       = {hl = 'GitGutterDelete', text = '▎'},
      topdelete    = {hl = 'GitGutterDelete', text = '▎'},
      changedelete = {hl = 'GitGutterChange', text = '▎'},
    },
  })
end

return {
  "lewis6991/gitsigns.nvim",
  config = config,
  requires = {{"nvim-lua/plenary.nvim"}}
}
