local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then

  local directory = string.format("%s/site/pack/packer/opt/", vim.fn.stdpath("data"))

  vim.fn.mkdir(directory, "p")

  print(vim.fn.system(string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim",
                                    directory .. "/packer.nvim")))

  return
end

return require("packer").startup(function()
  use {"wbthomason/packer.nvim", opt = true}

  use {
    "arcticicestudio/nord-vim",
    config = function()
      vim.cmd [[colorscheme nord]]
    end,
  }

  use {
    "tjdevries/express_line.nvim",
    config = function()
      local builtin = require("el.builtin")
      local extensions = require("el.extensions")
      local sections = require("el.sections")
      local subscribe = require("el.subscribe")

      local lsp_statusline = require("el.plugins.lsp_status")

      require("el").setup {
        generator = function(win_id)
          return {
            extensions.mode,
            sections.split,
            subscribe.buf_autocmd("el_file_icon", "BufRead", extensions.file_icon),
            " ",
            builtin.responsive_file(140, 90),
            sections.collapse_builtin {" ", builtin.modified_flag},
            sections.split,
            lsp_statusline.server_progress,
            " ",
            subscribe.buf_autocmd("el_git_changes", "BufWritePost", extensions.git_changes),
            " ",
            "[",
            builtin.line_with_width(3),
            ":",
            builtin.column_with_width(2),
            "]",
            sections.collapse_builtin {" [", builtin.help_list, builtin.readonly_list, "]"},
            sections.collapse_builtin {" ", builtin.filetype},
          }
        end,
      }
    end,
    requires = {{"kyazdani42/nvim-web-devicons"}, {"nvim-lua/lsp-status.nvim"}},
  }

  use "gu-fan/riv.vim"
  use {
    "previm/previm",
    config = function()
      vim.g.previm_open_cmd = "xdg-open"
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
  use "mhinz/vim-startify"

  use "kdheepak/lazygit.nvim"

  use {"krasjet/auto.pairs"}

  use {
    "nvim-lua/telescope.nvim",
    config = function()
      require("telescope").setup {}
      local utils = require("utils")

      utils.map("n", "<space>pf", {}, require("telescope.builtin").find_files)
      utils.map("n", "<space>pg", {}, require("telescope.builtin").live_grep)
      utils.map("n", "<space>pb", {}, require("telescope.builtin").buffers)
      utils.map("n", "<space>pc", {}, require("telescope.builtin").commands)
      utils.map("n", "<space>pa", {}, require("telescope.builtin").lsp_code_actions)
    end,
    requires = {
      {"nvim-lua/popup.nvim", requires = {"nvim-lua/plenary.nvim"}},
      {"kyazdani42/nvim-web-devicons"},
    },
  }

  use {
    "puremourning/vimspector",
    disable = true,
    config = function()
      vim.g.vimspector_enable_mappings = "HUMAN"
    end,
  }

  use {
    "neovim/nvim-lspconfig",
    config = function()
      local nvim_lsp = require("nvim_lsp")
      local utils = require("utils")

      nvim_lsp.yamlls.setup {}
      nvim_lsp.jsonls.setup {}
      nvim_lsp.rust_analyzer.setup {}
      nvim_lsp.sumneko_lua.setup {
        settings = {
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

      utils.map("n", "<space>gd", {silent = true}, vim.lsp.buf.definition)
      utils.map("n", "<space>gi", {silent = true}, vim.lsp.buf.implementation)
      utils.map("n", "<space>gy", {silent = true}, vim.lsp.buf.type_definition)
      utils.map("n", "<space>gr", {silent = true}, vim.lsp.buf.references)

      utils.map("n", "<space>h", {silent = true}, vim.lsp.buf.hover)
    end,
  }

  use {
    "nvim-lua/completion-nvim",
    config = function()
      vim.o.completeopt = "menuone,noinsert,noselect"
      vim.o.shortmess = vim.o.shortmess .. "c"

      local utils = require("utils")
      local completion = require("completion")

      utils.map("i", "<Tab>", {}, function()
        if vim.fn.pumvisible() == 1 then
          utils.send_keys("<C-n>",false)
        else
          utils.send_keys("<Tab>",true)
        end
      end)
      utils.map("i", "<S-Tab>", {}, function()
        if vim.fn.pumvisible() == 1 then
          utils.send_keys("<C-p>",false)
        else
          utils.send_keys("<S-Tab>",true)
        end
      end)

      utils.map("i", "<C-Space>", {silent = true}, completion.triggerCompletion)

      utils.autocmd("BufEnter", "*", completion.on_attach)

    end,
  }
end)
