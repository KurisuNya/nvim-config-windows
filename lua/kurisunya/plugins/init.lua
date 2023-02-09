--------------------------------
--                            --
--    plugin-manager-setup    --
--                            --
--------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("kurisunya.plugins.plugins")
-------------------------
--                     --
--    plugin-config    --
--                     --
-------------------------
-- cmp plugins
require("kurisunya.plugins.cmp.nvim-cmp")
require("kurisunya.plugins.cmp.autopairs")
-- lsp plugins
require("kurisunya.plugins.lsp.lspconfig")
require("kurisunya.plugins.lsp.null-ls")
-- function plugins
require("kurisunya.plugins.function.project")
require("kurisunya.plugins.function.nvim-treesitter")
require("kurisunya.plugins.function.telescope")
require("kurisunya.plugins.function.highlightedyank")
-- ui plugins
require("kurisunya.plugins.ui.nvim-tree")
require("kurisunya.plugins.ui.bufferline")
require("kurisunya.plugins.ui.lualine")
require("kurisunya.plugins.ui.dashboard")
require("kurisunya.plugins.ui.gitsigns")
