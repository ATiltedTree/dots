local M = {}

function M.config()
  local utils = require("utils")

  vim.g.lua_tree_ignore = {".git", "target" }
  vim.g.lua_tree_git_hl = 1
  vim.g.lua_tree_auto_close = 1
  vim.g.lua_tree_auto_open = 1

  vim.g.lua_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
  }

  vim.g.lua_tree_icons = {
    default = '',
    git= {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★"
    },
    folder = {
      default = "",
      open = ""
    }
  }

  utils.map("n", "<space>op",{},require("tree").toggle)
end

return M

