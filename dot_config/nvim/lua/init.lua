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
vim.g.loaded_python3_provider = 0

---- NodeJS
vim.g.loaded_node_provider = 0

---- Ruby
vim.g.loaded_ruby_provider = 0

---- Perl
vim.g.loaded_perl_provider = 0

require("plugins")
