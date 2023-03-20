------------------
--  bufferline  --
------------------
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
--切换标签
keymap.set("n", "<C-PageUp>", ":BufferLineCyclePrev<CR>", opts)
keymap.set("n", "<C-PageDown>", ":BufferLineCycleNext<CR>", opts)
--打开标签
keymap.set("n", "<C-Ins>", ":tabnew<CR>", opts)
--关闭标签
keymap.set("n", "<C-Del>", ":Bdelete!<CR>", opts)
keymap.set("n", "<C-End><C-End>", ":BufferLinePickClose<CR>", opts)
keymap.set("n", "<C-End><C-PageDown>", ":BufferLineCloseRight<CR>", opts)
keymap.set("n", "<C-End><C-PageUp>", ":BufferLineCloseLeft<CR>", opts)
