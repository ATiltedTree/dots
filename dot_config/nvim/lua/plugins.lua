local utils = require("utils")

local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
  local install_path = vim.fn.stdpath('data').."/site/pack/packer/opt/packer.nvim"

  vim.fn.system("git clone https://github.com/wbthomason/packer.nvim "..install_path)
  vim.cmd [[packadd packer.nvim]]
end

function load_plugins()
  local plugin_files = utils.read_dir(vim.fn.stdpath("config") .. "/lua/plugins")
  local plugins = {}

  for _, file in ipairs(plugin_files.files) do
    local module = file:gsub(".lua", "")

    if module ~= "init" then
      table.insert(plugins, require("plugins." .. module))
    end
  end

  return plugins
end

return require("packer").startup({
  load_plugins(),
  config = {
    display = {
      open_fn = require("packer.util").float,
    }
  }
})

