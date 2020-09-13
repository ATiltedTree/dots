vim.cmd("packadd packer.nvim")

return require("packer").startup(function()
  use {"wbthomason/packer.nvim", opt = true}

  use {
    "arcticicestudio/nord-vim",
    config = function()
      vim.cmd("colorscheme nord")
      vim.g.airline_theme = "nord"
    end,
  }

  use {
    "vim-airline/vim-airline",
    config = function()
      vim.g.airline_powerline_fonts = 1

      -- Move to vim.g when possible
      vim.api.nvim_set_var("airline#extensions#tabline#enabled", 1)
      vim.api.nvim_set_var("airline#extensions#tabline#show_buffers", 0)
    end,
  }

  use "sheerun/vim-polyglot"

  use "lambdalisue/suda.vim"

  use "airblade/vim-gitgutter"

  use "lambdalisue/glyph-palette.vim"
  use "lambdalisue/nerdfont.vim"

  use {
    "lambdalisue/fern.vim",
    config = function()
      vim.api.nvim_set_keymap("", "<C-n>", ":Fern -drawer .<CR>", {})
    end,
    requires = {
      {
        "lambdalisue/fern-renderer-nerdfont.vim",
        config = function()
          -- Move to vim.g aswell
          vim.api.nvim_set_var("fern#renderer", "nerdfont")
        end,
      },
      {"lambdalisue/fern-git-status.vim"},
    },
  }

  use "jreybert/vimagit"
  use "antoinemadec/FixCursorHold.nvim"

  use "jiangmiao/auto-pairs"

  use {
    "luochen1990/rainbow",
    config = function()
      vim.g.rainbow_active = 1
    end,
  }

  use {
    "puremourning/vimspector",
    config = function()
      vim.g.vimspector_enable_mappings = "HUMAN"
    end,
  }

  use {"romgrk/todoist.nvim", run = "npm install"}

  use "mhinz/vim-startify"

  use {
    "neovim/nvim-lspconfig",
    config = function()
      local nvim_lsp = require("nvim_lsp")
      nvim_lsp.rust_analyzer.setup {}

      local opts = {silent = true}
      vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      vim.api.nvim_set_keymap("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      vim.api.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
      vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      vim.api.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
      vim.api.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
    end,
  }

  use {
    "haorenW1025/completion-nvim",
    config = function()
      vim.o.completeopt = "menuone,noinsert,noselect"
      vim.o.shortmess = vim.o.shortmess .. "c"

      vim.api.nvim_set_keymap("i", "<Tab>", "pumvisible() ? \"<C-n>\" : \"<Tab>\"", {expr = true})
      vim.api.nvim_set_keymap("i", "<S-Tab>", "pumvisible() ? \"<C-p>\" : \"<S-Tab>\"",
                              {expr = true})
      vim.api.nvim_set_keymap("i", "<C-Space>", "completion#trigger_completion()",
                              {expr = true, silent = true})

      vim.cmd("autocmd BufEnter * lua require'completion'.on_attach()")
    end,
    requires = {{"hrsh7th/vim-vsnip"}, {"hrsh7th/vim-vsnip-integ"}},
  }

  use {
    "nvim-lua/diagnostic-nvim",
    config = function()
      vim.g.diagnostic_enable_virtual_text = 1
      vim.g.diagnostic_virtual_text_prefix = " "

      vim.cmd("autocmd BufEnter * lua require'diagnostic'.on_attach()")
    end,
  }
end)
