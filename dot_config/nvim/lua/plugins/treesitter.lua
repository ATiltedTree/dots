function config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
      enable = true,
      use_languagetree = true,
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  config = config,
}
