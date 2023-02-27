local status, project = pcall(require, "project_nvim")
if not status then
	return
end

-- nvim-tree 支持
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
	manual_mode = false,
	detection_methods = { "lsp", "pattern" },
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
	ignore_lsp = { "efm", "copilot" },
	exclude_dirs = {},
	show_hidden = false,
	silent_chdir = true,
	scope_chdir = "global",
	datapath = vim.fn.stdpath("data"),
})
