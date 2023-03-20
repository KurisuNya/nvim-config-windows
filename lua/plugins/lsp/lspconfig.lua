-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- import neodev plugin safely
local neodev_status, neodev = pcall(require, "neodev")
if not neodev_status then
	return
end
neodev.setup({})

-- general settings
local on_attach = require("core.keymaps").lspconfig.on_attach()
local capabilities = cmp_nvim_lsp.default_capabilities()

-- lsp-server settings
lspconfig["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["arduino_language_server"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["pylsp"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391" },
					maxLineLength = 100,
				},
			},
		},
	},
})
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

-- lsp-ui
local function lspSymbol(name, icon)
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

local lsp_ui = require("plugins.ui.lsp-ui")
lspSymbol("Error", lsp_ui.diagnostics.icons.error)
lspSymbol("Info", lsp_ui.diagnostics.icons.info)
lspSymbol("Hint", lsp_ui.diagnostics.icons.hint)
lspSymbol("Warn", lsp_ui.diagnostics.icons.warning)

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp_ui.hover_actions)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp_ui.hover_actions)
