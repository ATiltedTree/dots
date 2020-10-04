local utils = require("utils")

vim.o.termguicolors = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.cursorline = true
vim.o.signcolumn = "yes:2"
vim.o.mouse = "nvi"
vim.o.updatetime = 500
vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.title = true
vim.o.swapfile = false
vim.o.hidden = true

vim.cmd [[filetype plugin indent on]]
vim.cmd [[syntax enable]]

-- Provider setup

---- Python
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "/usr/bin/python"

---- NodeJS
vim.g.loaded_node_provider = 0
vim.g.node_host_prog = "/usr/bin/neovim-node-host"

---- Ruby
vim.g.loaded_ruby_provider = 0

---- Perl
vim.g.loaded_perl_provider = 0

-- Mappings
utils.map("", "<C-h>", {}, function()
  vim.cmd [[wincmd h]]
end)
utils.map("", "<C-j>", {}, function()
  vim.cmd [[wincmd j]]
end)
utils.map("", "<C-k>", {}, function()
  vim.cmd [[wincmd k]]
end)
utils.map("", "<C-l>", {}, function()
  vim.cmd [[wincmd l]]
end)

-- Plugins

require("plugins")
