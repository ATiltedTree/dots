local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
  local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
  
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim "..install_path)
  vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup({
  function()
    use { "wbthomason/packer.nvim", opt = true }

    use {
      {
        "joshdick/onedark.vim",
        config = function()
          vim.cmd [[colorscheme onedark]]
        end,
      },
      require("plugins.treesitter"),
      require("plugins.barbar"),
      require("plugins.galaxyline"),
      require("plugins.suda"),
      require("plugins.auto-pairs"),
      require("plugins.visual-multi"),
      require("plugins.gitsigns"),
      require("plugins.tree"),
      require("plugins.lspconfig"),
      require("plugins.lsp_extensions"),
      require("plugins.lsputils"),
      require("plugins.completion"),
      require("plugins.which-key"),
      require("plugins.telescope"),
      require("plugins.neogit"),
    }
  end,
  config = {
    non_interactive = true
  }
})

