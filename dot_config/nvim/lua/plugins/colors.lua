function config()
  vim.g.edge_style = "aura"
  vim.g.edge_enable_italic = false
  vim.g.edge_sign_column_background = "none"
  vim.cmd [[colorscheme edge]]
end

return {
  "sainnhe/edge",
  config = config,
}
