local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  -- TODO: Maybe handle windows better?
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then return end

  local directory = string.format("%s/site/pack/packer/opt/", vim.fn.stdpath("data"))

  vim.fn.mkdir(directory, "p")

  local out = vim.fn.system(string.format("git clone %s %s",
                                          "https://github.com/wbthomason/packer.nvim",
                                          directory .. "/packer.nvim"))

  print(out)
  print("Downloading packer.nvim...")

  return
end

return require("packer").startup(function()
  use {"wbthomason/packer.nvim", opt = true}

  use {
    "arcticicestudio/nord-vim",
    config = function()
      vim.cmd("colorscheme nord")
    end,
  }

  use {
    "tjdevries/express_line.nvim",
    config = function()
      require("el").setup {
      
      }
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        highlight = {enable = true},
      }
    end,
  }

  use "lambdalisue/suda.vim"

  use "airblade/vim-gitgutter"

  use "jreybert/vimagit"
  use "antoinemadec/FixCursorHold.nvim"

  use "jiangmiao/auto-pairs"

  use {
    "nvim-lua/telescope.nvim",
    config = function()
      require("telescope").setup {}
      local utils = require("utils")

      utils.map("n", "<C-p>", {}, function()
        require("telescope.builtin").find_files {}
      end)
      utils.map("n", "<C-S-s>", {}, function()
        require("telescope.builtin").live_grep {}
      end)
    end,
    requires = {{"nvim-lua/popup.nvim", requires = {"nvim-lua/plenary.nvim"}}},
  }

  use {
    "puremourning/vimspector",
    config = function()
      vim.g.vimspector_enable_mappings = "HUMAN"
    end,
  }

  use "mhinz/vim-startify"

  use {
    "neovim/nvim-lspconfig",
    config = function()
      local nvim_lsp = require("nvim_lsp")
      local utils = require("utils")
      nvim_lsp.rust_analyzer.setup {}
      nvim_lsp.sumneko_lua.setup {
        setings = {
          Lua = {
            runtime = {version = "LuaJIT", path = vim.split(package.path, ";")},
            diagnostics = {enable = true, globals = {"vim", "use"}},
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("~/.cache/pikaur/build/neovim-git/src/neovim-git/src/nvim/lua")] = true,
              },
            },
          },
        },
        cmd = {"/usr/bin/lua-language-server"},
      }

      utils.map("n", "gd", {silent = true}, vim.lsp.buf.definition)
      utils.map("n", "gi", {silent = true}, vim.lsp.buf.implementation)
      utils.map("n", "gy", {silent = true}, vim.lsp.buf.type_definition)
      utils.map("n", "gr", {silent = true}, vim.lsp.buf.references)

      utils.map("n", "K", {silent = true}, vim.lsp.buf.hover)
    end,
  }

  use {
    "nvim-lua/completion-nvim",
    config = function()
      vim.o.completeopt = "menuone,noinsert,noselect"
      vim.o.shortmess = vim.o.shortmess .. "c"

      local utils = require("utils")

      utils.map("i", "<Tab>", {}, function()
        if vim.fn.pumvisible() == 1 then
          vim.api.nvim_input("<C-n>")
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "tn",
                                true)
        end
      end)
      utils.map("i", "<S-Tab>", {}, function()
        if vim.fn.pumvisible() == 1 then
          vim.api.nvim_input("<C-p>")
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "tn",
                                true)
        end
      end)

      utils.map("i", "<C-Space>", {silent = true}, function()
        require("completion").triggerCompletion()
      end)

      require("utils").autocmd("BufEnter", "*", function()
        require("completion").on_attach()
      end)

    end,
    requires = {{"hrsh7th/vim-vsnip"}, {"hrsh7th/vim-vsnip-integ"}},
  }

  use {
    "nvim-lua/diagnostic-nvim",
    config = function()
      vim.g.diagnostic_enable_virtual_text = 1
      vim.g.diagnostic_virtual_text_prefix = " "

      require("utils").autocmd("BufEnter", "*", function()
        require("diagnostic").on_attach()
      end)
    end,
  }
end)
