local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  print("Packer is missing! Not loading plugins")
  return
end

return require("packer").startup(function()
  use {"wbthomason/packer.nvim", opt = true}

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        highlight = {
          enable = true,
          use_languagetree = true,
        },
      })
    end,
  }

  use {
    "arcticicestudio/nord-vim",
    config = function()
      vim.cmd [[colorscheme nord]]
    end
  }

  -- Replace with https://github.com/glepnir/galaxyline.nvim with https://github.com/nvim-lua/lsp-status.nvim
  use {
    "tjdevries/express_line.nvim",
    config = function()
      local builtin = require("el.builtin")
      local extensions = require("el.extensions")
      local sections = require("el.sections")
      local subscribe = require("el.subscribe")

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
            subscribe.buf_autocmd("el_git_changes", "BufWritePost", extensions.git_changes),
            "%( [",
            subscribe.buf_autocmd("el_git_branch", "BufEnter", extensions.git_branch),
            "] %)",
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
    requires = {{"kyazdani42/nvim-web-devicons"}},
  }

  use {
    "akinsho/nvim-bufferline.lua",
    config = function()
      require("bufferline").setup({
        options = {
          view = "default",
          numbers = "none",
          show_buffer_close_icons = true,
        }
      })
      
      local utils = require("utils")
      
      utils.map("", "<C-PageDown>", {}, function()
        require("bufferline").cycle(1)
      end)
      utils.map("", "<C-PageUp>", {}, function()
        require("bufferline").cycle(-1)
      end)

    end,
    requires = {{"kyazdani42/nvim-web-devicons"}}
  }

  use {
    "lambdalisue/suda.vim",
    config = function()
      vim.g.suda_smart_edit = 1
    end
  }

  use "krasjet/auto.pairs"
  use "mg979/vim-visual-multi"

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
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
  }

  use {
    "glepnir/dashboard-nvim",
    config = function()
      vim.g.dashboard_default_executive = "telescope"
    end
  }

  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      local utils = require("utils")

      vim.g.lua_tree_ignore = {".git", "target" }
      vim.g.lua_tree_git_hl = 1
      vim.g.lua_tree_show_icons = {
        git = 1,
        folders = 1,
        files = 1
      }
      utils.map("n", "<space>op",{},require("tree").toggle)
    end
  }

  use {
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<space>ot]],
      })
    end
  }

  use {
    "nvim-lua/telescope.nvim",
    config = function()
      require("telescope").setup({})
      local utils = require("utils")

      utils.map("n", "<space><space>", {}, require("telescope.builtin").find_files)
      utils.map("n", "<space>pg", {}, require("telescope.builtin").live_grep)
      utils.map("n", "<space>pb", {}, require("telescope.builtin").buffers)
      utils.map("n", "<space>pc", {}, require("telescope.builtin").commands)
      utils.map("n", "<space>ps", {}, require("telescope.builtin").lsp_workspace_symbols)
    end,
    requires = {
      {"nvim-lua/popup.nvim", requires = {"nvim-lua/plenary.nvim"}},
      {"kyazdani42/nvim-web-devicons"},
    },
  }

  use {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local utils = require("utils")

      lspconfig.yamlls.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.dartls.setup({
        init_options = {
          closingLabels = true,
        },
        handlers = {
          ['dart/textDocument/publishClosingLabels'] = require('lsp_extensions.dart.closing_labels').get_callback({highlight = "Comment", prefix = " // "}),
        },
      })

      utils.map("n", "<space>gd", {silent = true}, vim.lsp.buf.definition)
      utils.map("n", "<space>gi", {silent = true}, vim.lsp.buf.implementation)
      utils.map("n", "<space>gy", {silent = true}, vim.lsp.buf.type_definition)
      utils.map("n", "<space>gr", {silent = true}, vim.lsp.buf.references)

      utils.map("n", "K", {silent = true}, vim.lsp.buf.hover)
      utils.map("n", "<space>af", {silent = true}, vim.lsp.buf.formatting)
      utils.map("n", "<space>ar", {silent = true}, vim.lsp.buf.rename)
      utils.map("n", "<space>ac", {silent = true}, vim.lsp.buf.code_action)

      vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
    end,
  }

  use {
    "nvim-lua/lsp_extensions.nvim",
    config = function()
      vim.cmd [[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require("lsp_extensions").inlay_hints({ prefix = "  ", highlight = "Comment" })]]
    end,
  }

  use {
    "RishabhRD/nvim-lsputils",
    config = function()
      vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
      vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
      vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
      vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
      vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
      vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
    end,
    requires = {{"RishabhRD/popfix"}}
  }

  use {
    "nvim-lua/completion-nvim",
    config = function()
      vim.o.completeopt = "menuone,noinsert,noselect"
      vim.o.shortmess = vim.o.shortmess .. "c"

      vim.g.completion_customize_lsp_label = {
        Function = '',
        Method = '',
        Reference = '',
        Enum = '',
        Field = 'ﰠ',
        Keyword = '',
        Variable = '',
        Folder = '',
        Snippet = ' ',
        Operator = '',
        Module = '',
        Text = 'ﮜ',
        Buffers = '',
        Class = '',
        Interface = ''
      }

      local utils = require("utils")
      local completion = require("completion")

      utils.map("i", "<Tab>", {}, function()
        if vim.fn.pumvisible() == 1 then
          utils.send_keys("<C-n>", false)
        else
          utils.send_keys("<Tab>", true)
        end
      end)
      utils.map("i", "<S-Tab>", {}, function()
        if vim.fn.pumvisible() == 1 then
          utils.send_keys("<C-p>", false)
        else
          utils.send_keys("<S-Tab>", true)
        end
      end)

      utils.map("i", "<C-Space>", {silent = true}, completion.triggerCompletion)

      vim.cmd [[autocmd BufEnter * lua require("completion").on_attach()]]
    end,
    requires = {
      {
        "hrsh7th/vim-vsnip-integ",
        opt = true,
        requires = {
          {"hrsh7th/vim-vsnip", opt = true}
        }
      }
    },
  }

end)
