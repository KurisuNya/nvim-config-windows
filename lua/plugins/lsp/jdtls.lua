local M = {}
function M.setup()
	local jdtls_status, jdtls = pcall(require, "jdtls")
	if not jdtls_status then
		return
	end
	-- workspace setting
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	-- local project_name = "all"
	local workspace_dir = "C:/Users/KurisuNya/AppData/Local/nvim-data/mason/packages/jdtls/workspace/" .. project_name
	-- config
	local config = {
		cmd = {
			"java",
			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.protocol=true",
			"-Dlog.level=NONE",
			"-Xms1g",
			-- "--add-modules=ALL-SYSTEM",
			-- "--add-opens",
			-- "java.base/java.util=ALL-UNNAMED",
			-- "--add-opens",
			-- "java.base/java.lang=ALL-UNNAMED",
			-- "-javaagent:C:/Users/KurisuNya/AppData/Local/nvim-data/mason/packages/jdtls/lombok.jar",
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
	local on_attach = require("core.keymaps").jdtls.on_attach()
	local capabilities = {
		workspace = {
			configuration = true,
		},
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = false,
				},
			},
		},
	}
	config.capabilities = capabilities
	config.on_attach = on_attach
	-- start_jdtls
	jdtls.start_or_attach(config)
end
return M
