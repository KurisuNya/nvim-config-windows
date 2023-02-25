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

-- import neodev plugin sadely
local neodev_status, neodev = pcall(require, "neodev")
if not neodev_status then
	return
end
neodev.setup({})

-- general settings
local keymap = vim.keymap -- for conciseness
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }
	keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "H", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
end
local capabilities = cmp_nvim_lsp.default_capabilities()

-- lsp-server settings
lspconfig["clangd"].setup({
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
	settings = { -- custom settings for lua
		Lua = {
			-- -- make the language server recognize "vim" global
			-- diagnostics = {
			-- 	globals = { "vim" },
			-- },
			-- workspace = {
			-- 	-- make language server aware of runtime files
			-- 	library = {
			-- 		[vim.fn.expand("$VIMRUNTIME/lua")] = true,
			-- 		[vim.fn.stdpath("config") .. "/lua"] = true,
			-- 	},
			-- },
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

local lsp_ui = require("kurisunya.plugins.ui.lsp-ui")
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
