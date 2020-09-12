vim.o.termguicolors = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.signcolumn = "auto:2"
vim.o.spell = true
vim.o.spelllang = "en_us"
vim.o.mouse = "nvi"
vim.o.guifont = "Fira Code:h10"
vim.o.updatetime = 500
vim.o.clipboard = "unnamedplus"
vim.o.directory = vim.call("stdpath","cache") .. "/swap//"

vim.cmd("filetype plugin indent on")

-- Provider setup

---- Python

vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "/usr/bin/python"

---- NodeJS

vim.g.node_host_prog = "/usr/bin/neovim-node-host"

require("plugins")
