-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({

	preselect = cmp.PreselectMode.Item,

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	experimental = {
		ghost_text = true,
	},

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	-- extra-keymaps
	mapping = cmp.mapping.preset.insert({
		["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		---@diagnostic disable-next-line: missing-parameter
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	sources = cmp.config.sources({
		{ name = "path", priority = 4 },
		{ name = "nvim_lsp", priority = 3 },
		{ name = "luasnip", priority = 2 },
		{ name = "buffer", priority = 2, max_item_count = 5 },
		{ name = "nvim_lsp_signature_help", priority = 2 },
		{ name = "nvim_lua", priority = 2 },
		{
			name = "spell",
			priority = 1,
			option = {
				keep_all_entries = false,
				enable_in_context = function()
					return true
				end,
			},
		},
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			require("cmp-under-comparator").under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})

cmp.setup.filetype({ "TelescopePrompt" }, {
	sources = {},
})
-- cmp.setup.filetype({ "vim", "markdown" }, {
-- 	sources = {
-- 		{
-- 			name = "spell",
-- 			option = {
-- 				keep_all_entries = false,
-- 				enable_in_context = function()
-- 					return true
-- 				end,
-- 			},
-- 		},
-- 	},
-- })
