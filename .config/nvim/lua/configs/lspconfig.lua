-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()


-- EXAMPLE
local servers = { "html", "cssls", "gopls", "csharp_ls", "ast_grep", "sqlls", "clangd", "pylsp", "jdtls", "postgres_lsp", "ts_ls", "svelte"}
-- local nvlsp = require "nvchad.configs.lspconfig"

vim.lsp.enable(servers)
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
