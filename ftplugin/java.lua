local jdtls = require("jdtls")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- workspace setting
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = "C:/Users/KurisuNya/AppData/Local/nvim-data/mason/packages/jdtls/workspace/" .. project_name

-- config
local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:C:/Users/KurisuNya/AppData/Local/nvim-data/mason/packages/jdtls/lombok.jar",
		"-jar",
		"C:/Users/KurisuNya/AppData/Local/nvim-data/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
		"C:/Users/KurisuNya/AppData/Local/nvim-data/mason/packages/jdtls/config_win",
		"-data",
		workspace_dir,
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
	settings = {
		java = {},
	},
	init_options = {
		bundles = {},
	},
}
local keymap = vim.keymap
local on_attach = function(client, bufnr)
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
	keymap.set("n", "\\", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
end
local capabilities = cmp_nvim_lsp.default_capabilities()
config.capabilities = capabilities
config.on_attach = on_attach
jdtls.start_or_attach(config)

-- luasnip setting
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
ls.add_snippets("java", {
	s("sout", {
		t({ "System.out.println(" }),
		i(1),
		t({ ");" }),
	}),
	s("main", {
		t({ "public static void main(String[] args) {" }),
		t({ "", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
	s("field", {
		c(1, {
			t("private"),
			t("public"),
			t("protected"),
		}),
		t(" "),
		c(2, {
			t(""),
			t({ "static " }),
			t({ "final " }),
			t({ "final static " }),
		}),
		i(3, "String"),
		t(" "),
		i(4, "name"),
		t({ ";" }),
	}),
	s("fn", {
		c(1, {
			t("public"),
			t("protected"),
			t("private"),
		}),
		t(" "),
		c(2, {
			t(""),
			t({ "static " }),
			t({ "final " }),
		}),
		i(3, "void"),
		t(" "),
		i(4, "name"),
		t("("),
		c(5, {
			t(""),
			sn(nil, {
				i(1, { "String" }),
				t(" "),
				i(2, { "arg1" }),
			}),
			sn(nil, {
				i(1, { "String" }),
				t(" "),
				i(2, { "arg1" }),
				t(", "),
				i(3, { "String" }),
				t(" "),
				i(4, { "arg2" }),
			}),
			sn(nil, {
				i(1, { "String" }),
				t(" "),
				i(2, { "arg1" }),
				t(", "),
				i(3, { "String" }),
				t(" "),
				i(4, { "arg2" }),
				t(", "),
				i(5, { "String" }),
				t(" "),
				i(6, { "arg3" }),
			}),
			sn(nil, {
				i(1, { "String" }),
				t(" "),
				i(2, { "arg1" }),
				t(", "),
				i(3, { "String" }),
				t(" "),
				i(4, { "arg2" }),
				t(", "),
				i(5, { "String" }),
				t(" "),
				i(6, { "arg3" }),
				t(", "),
				i(7, { "String" }),
				t(" "),
				i(8, { "arg4" }),
			}),
		}),
		t(")"),
		c(6, {
			t(""),
			sn(nil, {
				t({ " throws " }),
				i(1, "Exception"),
			}),
		}),
		t(" {"),
		t({ "", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
	s("afn", {
		c(1, {
			t("protected"),
			t("public"),
		}),
		t(" abstract "),
		i(2, "void"),
		t(" "),
		i(3, "name"),
		t("("),
		c(4, {
			t(""),
			sn(nil, {
				i(1, { "String" }),
				t(" "),
				i(2, { "arg1" }),
			}),
			sn(nil, {
				i(1, { "String" }),
				t(" "),
				i(2, { "arg1" }),
				t(", "),
				i(3, { "String" }),
				t(" "),
				i(4, { "arg2" }),
			}),
			sn(nil, {
				i(1, { "String" }),
				t(" "),
				i(2, { "arg1" }),
				t(", "),
				i(3, { "String" }),
				t(" "),
				i(4, { "arg2" }),
				t(", "),
				i(5, { "String" }),
				t(" "),
				i(6, { "arg3" }),
			}),
			sn(nil, {
				i(1, { "String" }),
				t(" "),
				i(2, { "arg1" }),
				t(", "),
				i(3, { "String" }),
				t(" "),
				i(4, { "arg2" }),
				t(", "),
				i(5, { "String" }),
				t(" "),
				i(6, { "arg3" }),
				t(", "),
				i(7, { "String" }),
				t(" "),
				i(8, { "arg4" }),
			}),
		}),
		t(")"),
		c(5, {
			t(""),
			sn(nil, {
				t({ " throws " }),
				i(1, "Exception"),
			}),
		}),
		t(";"),
	}),
	s("ifn", {
		i(1, "void"),
		t(" "),
		i(2, "name"),
		t("("),
		c(3, {
			t(""),
			sn(nil, {
				i(1, { "String" }),
				t(" "),
				i(2, { "arg1" }),
			}),
			sn(nil, {
				i(1, { "String" }),
				t(" "),
				i(2, { "arg1" }),
				t(", "),
				i(3, { "String" }),
				t(" "),
				i(4, { "arg2" }),
			}),
			sn(nil, {
				i(1, { "String" }),
				t(" "),
				i(2, { "arg1" }),
				t(", "),
				i(3, { "String" }),
				t(" "),
				i(4, { "arg2" }),
				t(", "),
				i(5, { "String" }),
				t(" "),
				i(6, { "arg3" }),
			}),
			sn(nil, {
				i(1, { "String" }),
				t(" "),
				i(2, { "arg1" }),
				t(", "),
				i(3, { "String" }),
				t(" "),
				i(4, { "arg2" }),
				t(", "),
				i(5, { "String" }),
				t(" "),
				i(6, { "arg3" }),
				t(", "),
				i(7, { "String" }),
				t(" "),
				i(8, { "arg4" }),
			}),
		}),
		t(")"),
		c(4, {
			t(""),
			sn(nil, {
				t({ " throws " }),
				i(1, "Exception"),
			}),
		}),
		t(";"),
	}),
})
