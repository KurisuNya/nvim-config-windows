------------------
--  bufferline  --
------------------
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
--切换标签
keymap.set("n", "<Tab><Left>", ":BufferLineCyclePrev<CR>", opts)
keymap.set("n", "<Tab><Right>", ":BufferLineCycleNext<CR>", opts)
--打开标签
keymap.set("n", "<Tab>n", ":tabnew<CR>", opts)
--关闭标签
keymap.set("n", "<Tab>cc", ":Bdelete!<CR>", opts)
keymap.set("n", "<Tab>ct", ":BufferLinePickClose<CR>", opts)
keymap.set("n", "<Tab>c<Right>", ":BufferLineCloseRight<CR>", opts)
keymap.set("n", "<Tab>c<Left>", ":BufferLineCloseLeft<CR>", opts)
