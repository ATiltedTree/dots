local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  print("Packer is missing! Not loading plugins")
  return
end

return require("packer").startup(function()
  use {"wbthomason/packer.nvim", opt = true}

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
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        highlight = {enable = true},
      })
    end,
  }

  use {
    "arcticicestudio/nord-vim",
    config = function()
        vim.cmd [[colorscheme nord]]
        vim.cmd [[hi LspDiagnosticsUnderlineError guifg=#BF616A gui=undercurl]]
        vim.cmd [[hi LspDiagnosticsUnderlineWarning guifg=#EBCB8B gui=undercurl]]
        vim.cmd [[hi LspDiagnosticsUnderlineInformation guifg=#88C0D0 gui=undercurl]]
        vim.cmd [[hi LspDiagnosticsUnderlineHint guifg=#5E81AC gui=undercurl]]
      end
  }

  use "lambdalisue/suda.vim"
  use "kdheepak/lazygit.nvim"
  use "krasjet/auto.pairs"
  use "mg979/vim-visual-multi"
  use "dag/vim-fish"

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
    add          = {hl = "GitSignsAdd"   , text = "+"},
    change       = {hl = "GitSignsChange", text = "~"},
    delete       = {hl = "GitSignsDelete", text = "-"},
    topdelete    = {hl = "GitSignsDelete", text = "-"},
    changedelete = {hl = "GitSignsChange", text = "~"},
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
    "nvim-lua/telescope.nvim",
    config = function()
      require("telescope").setup({})
      local utils = require("utils")

      utils.map("n", "<space>pf", {}, require("telescope.builtin").find_files)
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

      nvim_lsp.yamlls.setup({})
      nvim_lsp.rust_analyzer.setup({})

      utils.map("n", "<space>gd", {silent = true}, vim.lsp.buf.definition)
      utils.map("n", "<space>gi", {silent = true}, vim.lsp.buf.implementation)
      utils.map("n", "<space>gy", {silent = true}, vim.lsp.buf.type_definition)
      utils.map("n", "<space>gr", {silent = true}, vim.lsp.buf.references)

      utils.map("n", "<space>ah", {silent = true}, vim.lsp.buf.hover)
      utils.map("n", "<space>af", {silent = true}, vim.lsp.buf.formatting)
      utils.map("n", "<space>ar", {silent = true}, vim.lsp.buf.rename)
      utils.map("n", "<space>ac", {silent = true}, vim.lsp.buf.code_action)

      vim.cmd [[autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()]]

      vim.lsp.callbacks["textDocument/publishDiagnostics"] = function(_, _, result)
        if not result then return end
        local bufnum = vim.uri_to_bufnr(result.uri)
        if not bufnum then return end
        if not vim.api.nvim_buf_is_loaded(bufnum) then return end

        vim.lsp.util.buf_clear_diagnostics(bufnum)

        for _, diagnostic in ipairs(result.diagnostics) do
          if diagnostic.severity == nil then
            diagnostic.severity = vim.lsp.protocol.DiagnosticSeverity.Error
          end
        end

        vim.lsp.util.buf_diagnostics_save_positions(bufnum,result.diagnostics)
        vim.lsp.util.buf_diagnostics_underline(bufnum,result.diagnostics)
        vim.lsp.util.buf_diagnostics_signs(bufnum,result.diagnostics)
      end
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
    requires = {{"hrsh7th/vim-vsnip-integ", requires = {{"hrsh7th/vim-vsnip"}}}},
  }


end)
