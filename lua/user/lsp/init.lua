-- require "user.lsp.gopls"
-- require'lspconfig'.tsserver.setup{}

require("user.lsp.mason")
require("user.lsp.null-ls")
require("user.lsp.handlers").setup()
