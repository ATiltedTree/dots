function config()
  function lspStatus()
    if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
      local error_count = vim.lsp.diagnostic.get_count(0, 'Error')
      local warning_count = vim.lsp.diagnostic.get_count(0, 'Warning')
      local info_count = vim.lsp.diagnostic.get_count(0, 'Information') +  vim.lsp.diagnostic.get_count(0, 'Hint') 
      return ' ' .. error_count .. '  ' .. warning_count .. '  ' .. info_count
    else
      return ''
    end
  end

  local lualine = require('lualine')
  lualine.theme = 'onedark'
  lualine.separator = '|'
  lualine.sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename', lspStatus },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location'  },
  }
  lualine.inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {   }
  }
  lualine.extensions = { 'fzf' }
  lualine.status()
end

return {
  "hoob3rt/lualine.nvim",
  config = config,
  requires = {{"kyazdani42/nvim-web-devicons"}}
}
