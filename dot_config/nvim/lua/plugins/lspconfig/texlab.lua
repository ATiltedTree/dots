local lspconfig = require("lspconfig")

lspconfig.texlab.setup {
  settings = {
    latex = {
      build = {
        onSave = true
      }
    }
  }
}
