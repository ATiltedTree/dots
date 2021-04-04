function config()
  require('lualine').setup({
    options = {
      theme = 'ayu_mirage'
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff' },
      lualine_c = { 'filename', {'diagnostics', sources = { 'nvim_lsp' } } },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {  },
      lualine_b = {  },
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {  },
      lualine_z = {  }
    }
  })
end

return {
  "hoob3rt/lualine.nvim",
  config = config,
  requires = {{"kyazdani42/nvim-web-devicons"}}
}
