function config()
  local utils = require("utils")

  utils.map("n","<leader>gg", {}, require("neogit.status").create)
end

return {
  "TimUntersberger/neogit",
  config = config,
}
