function config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
      enable = true,
    },
    indent = {
--      enable = true,
    },
    rainbow = {
      enable = true,
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  config = config,
  requires = {
    "romgrk/nvim-treesitter-context",
    "p00f/nvim-ts-rainbow",
  }
}
