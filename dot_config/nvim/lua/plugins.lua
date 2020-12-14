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
      {
        "nvim-treesitter/nvim-treesitter",
        config = require("plugins.treesitter").config
      },
      {
        "romgrk/barbar.nvim",
        config = require("plugins.barbar").config,
        requires = {{"kyazdani42/nvim-web-devicons"}},
      },
      {
        "glepnir/galaxyline.nvim",
        config = require("plugins.galaxyline").config,
        requires = {{"kyazdani42/nvim-web-devicons"}}
      },
      {
        "lambdalisue/suda.vim",
        config = require("plugins.suda").config,
      },
      { 
        "krasjet/auto.pairs",
        config = require("plugins.auto-pairs").config,
      },
      {
        "mg979/vim-visual-multi",
        config = require("plugins.visual-multi").config,
      },
      {
        "lewis6991/gitsigns.nvim",
        config = require("plugins.gitsigns").config,
        requires = {{"nvim-lua/plenary.nvim"}}
      },
      {
        "kyazdani42/nvim-tree.lua",
        config = require("plugins.tree").config,
        requires = {{"kyazdani42/nvim-web-devicons"}}
      },
      {
        "neovim/nvim-lspconfig",
        config = require("plugins.lspconfig").config,
      },
      {
        "nvim-lua/lsp_extensions.nvim",
        config = require("plugins.lsp_extensions").config,
      },
      {
        "RishabhRD/nvim-lsputils",
        config = require("plugins.lsputils").config,
        requires = {{"RishabhRD/popfix", run = "make"}}
      },
      {
        "nvim-lua/completion-nvim",
        config = require("plugins.completion").config,
        requires = {{"hrsh7th/vim-vsnip-integ", requires = {"hrsh7th/vim-vsnip"}}}
      },
      {
        "liuchengxu/vim-which-key",
        config = require("plugins.which-key").config,
      },
      {
        "nvim-telescope/telescope.nvim",
        config = require("plugins.telescope").config,
        requires = {
          {"nvim-lua/popup.nvim"},
          {"nvim-lua/plenary.nvim"},
          {"nvim-telescope/telescope-packer.nvim"},
          --{"nvim-telescope/telescope-dap.nvim"},
        },
      },
    }
  end,
  config = {
    non_interactive = true
  }
})

