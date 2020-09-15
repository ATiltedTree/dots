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
vim.o.directory = vim.fn.stdpath("cache") .. "/swap//"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.title = true

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

-- Provider setup

---- Python

vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "/usr/bin/python"

---- NodeJS

vim.g.node_host_prog = "/usr/bin/neovim-node-host"

require("plugins")
