function config()
  require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
    use_consistent_indetation = true,
  })

  vim.api.nvim_set_keymap("n", "<leader>cic", "<Plug>kommentary_line_increase", {})
  vim.api.nvim_set_keymap("n", "<leader>ci", "<Plug>kommentary_motion_increase", {})
  vim.api.nvim_set_keymap("v", "<leader>ci", "<Plug>kommentary_visual_increase", {})
  
  vim.api.nvim_set_keymap("n", "<leader>cdc", "<Plug>kommentary_line_decrease", {})
  vim.api.nvim_set_keymap("n", "<leader>cd", "<Plug>kommentary_motion_decrease", {})
  vim.api.nvim_set_keymap("v", "<leader>cd", "<Plug>kommentary_visual_decrease", {})
  
  vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
  vim.api.nvim_set_keymap("v", "<leader>cc", "<Plug>kommentary_visual_default", {})

end

return {
  "b3nj5m1n/kommentary",
  config = config,
}
