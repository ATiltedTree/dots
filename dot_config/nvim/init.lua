vim.g.mapleader = " "
vim.g.maplocalleader = " m"

vim.o.termguicolors = true

vim.o.expandtab = true
vim.bo.expandtab = true

vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

vim.o.number = true
vim.wo.number = true

vim.o.cursorline = true
vim.wo.cursorline = true

vim.o.signcolumn = "yes:2"
vim.wo.signcolumn = "yes:2"

vim.o.mouse = "nvi"
vim.o.updatetime = 500
vim.o.clipboard = "unnamedplus"
vim.o.smartcase = true
vim.o.title = true

vim.o.swapfile = false
vim.bo.swapfile = false

vim.o.hidden = true

vim.o.wrap = false
vim.wo.wrap = false

-- Neovide
vim.g.neovide_cursor_animation_length = 0
vim.o.guifont = "monospace:h13"

vim.cmd [[set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾]]

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
