function config()
  local telescope = require("telescope")
  local builtins = require("telescope.builtin")
  local previewers = require("telescope.previewers")
  local utils = require("utils")

  telescope.setup({
    defaults = {
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,
    }
  })

  utils.map("n","<leader><Space>", {}, builtins.git_files)
  utils.map("n","<leader>.", {}, builtins.find_files)
  utils.map("n","<leader>/", {}, builtins.live_grep)
  utils.map("n","<leader>:", {}, builtins.commands)

  -- Search
  utils.map("n","<leader>sb", {}, builtins.current_buffer_fuzzy_find)
  utils.map("n","<leader>sm", {}, builtins.man_pages)

  -- Code
  utils.map("n","<leader>cj", {}, builtins.lsp_workspace_symbols)

  -- Buffer
  utils.map("n","<leader>bb", {}, builtins.buffers)

  -- Files
  utils.map("n", "<leader>fr", {}, builtins.oldfiles)
  
  -- telescope-packer CAUSES ALL PLUGINS TO BE REMOVED
  --utils.map("n","<leader>hp", {}, telescope.extensions.packer.plugins)
end

return {
  "nvim-telescope/telescope.nvim",
  config = config,
  requires = {
    {"nvim-lua/popup.nvim"},
    {"nvim-lua/plenary.nvim"},
    {"nvim-telescope/telescope-packer.nvim"},
    --{"nvim-telescope/telescope-dap.nvim"},
  },
}
