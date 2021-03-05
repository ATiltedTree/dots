function config()
  vim.g.ayucolor = "mirage"
  vim.cmd [[colorscheme ayu]]
end

return {
  "Luxed/ayu-vim",
  config = config,
}
