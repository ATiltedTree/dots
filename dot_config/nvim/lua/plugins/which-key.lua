function config()
  local utils = require("utils")

  utils.map("n", "<leader>", {}, function()
    vim.fn["which_key#start"](0, 0, "<Space>")
  end)
end

return {
  "liuchengxu/vim-which-key",
  config = config,
}
