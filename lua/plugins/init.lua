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
require("lazy").setup("plugins.plugins")
-------------------------
--                     --
--    plugin-config    --
--                     --
-------------------------
-- cmp plugins
require("plugins.cmp.nvim-cmp")
require("plugins.cmp.autopairs")
-- lsp plugins
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")
-- function plugins
require("plugins.function.project")
require("plugins.function.nvim-treesitter")
require("plugins.function.telescope")
require("plugins.function.highlightedyank")
require("plugins.function.nvim-spectre")
-- ui plugins
require("plugins.ui.nvim-tree")
require("plugins.ui.bufferline")
require("plugins.ui.lualine")
require("plugins.ui.dashboard")
require("plugins.ui.gitsigns")
