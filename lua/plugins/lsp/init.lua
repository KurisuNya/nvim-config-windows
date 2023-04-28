-------------------
--  lsp-plugins  --
-------------------
require("plugins.lsp.mason")
require("plugins.lsp.mason-lspconfig")
require("plugins.lsp.null-ls")
require("plugins.lsp.lspsaga")
require("plugins.lsp.lspconfig")
require("plugins.lsp.trouble")
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "java",
-- 	callback = function()
-- 		require("plugins.lsp.jdtls").setup()
-- 	end,
-- })
