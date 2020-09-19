local utils = require("utils")

vim.o.termguicolors = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.cursorline = true
vim.o.signcolumn = "yes:2"
vim.o.mouse = "nvi"
vim.o.guifont = "Fira Code:h10"
vim.o.updatetime = 500
vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.title = true
vim.o.swapfile = false
vim.o.hidden = true

vim.cmd [[filetype plugin indent on]]
vim.cmd [[syntax enable]]

-- Fix CursorHold
vim.cmd [[set eventignore+=CursorHold,CursorHoldI]]

utils.augroup("fix_cursorhold", true, function()
  utils.autocmd("CursorMoved", "*", function()
    vim.defer_fn(function()
      vim.cmd [[set eventignore-=CursorHold]]
      vim.cmd [[doautocmd <nomodeline> CursorHold]]
      vim.cmd [[set eventignore+=CursorHold]]
    end, vim.o.updatetime)
  end)
  utils.autocmd("CursorMovedI", "*", function()
    vim.defer_fn(function()
      vim.cmd [[set eventignore-=CursorHoldI]]
      vim.cmd [[doautocmd <nomodeline> CursorHoldI]]
      vim.cmd [[set eventignore+=CursorHoldI]]
    end, vim.o.updatetime)
  end)
end)

-- Provider setup

---- Python
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "/usr/bin/python"

---- NodeJS
vim.g.node_host_prog = "/usr/bin/neovim-node-host"

---- Ruby
vim.g.loaded_ruby_provider = 0

---- Perl
vim.g.loaded_perl_provider = 0

-- Plugins

require("plugins")
