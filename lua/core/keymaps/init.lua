-------------------
--  nvim-keymap  --
-------------------
require("core.keymaps.nvim")
--------------------
-- plugin-keymap  --
--------------------
----  direct  ----
require("core.keymaps.bufferline")
require("core.keymaps.diffview")
require("core.keymaps.git-signs")
require("core.keymaps.hop")
require("core.keymaps.markdown-preview")
require("core.keymaps.telescope")
require("core.keymaps.troubles")
require("core.keymaps.vim-maxmizer")
----  by return  ----
local plugin_keymap = {} --start
plugin_keymap.lspconfig = require("core.keymaps.lspconfig")
plugin_keymap.nvim_cmp = require("core.keymaps.nvim-cmp")
plugin_keymap.nvim_spectre = require("core.keymaps.nvim-spectre")
plugin_keymap.nvim_tree = require("core.keymaps.nvim-tree")
return plugin_keymap --end
