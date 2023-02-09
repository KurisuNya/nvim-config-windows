local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("没有找到 nvim-treesitter")
	return
end

treesitter.setup({
	-- 启用代码高亮模块
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { "python" },
	},
	autotag = {
		enable = true,
	},
	-- rainbow = {
	-- 	enable = true,
	-- 	extended_mode = true,
	-- 	max_file_lines = nil,
	-- },
})
-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
vim.opt.foldlevel = 99
