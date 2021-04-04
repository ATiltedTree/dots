-- require("flutter-tools").setup {
--   flutter_outline = {
--     enabled = false
--   },
--   experimental = {
--     lsp_derive_paths = true,
--   }
-- }

local lspconfig = require("lspconfig")

lspconfig.dartls.setup {
  settings = {
    dart = {
      previewLsp = true
    }
  }
}
