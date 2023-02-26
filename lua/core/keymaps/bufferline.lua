------------------
--  bufferline  --
------------------
local keymap = vim.keymap
--切换标签
keymap.set("n", "<Tab><Left>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<Tab><Right>", ":BufferLineCycleNext<CR>")
--打开标签
keymap.set("n", "<Tab>n", ":tabnew<CR>")
--关闭标签
keymap.set("n", "<Tab>cc", ":Bdelete!<CR>")
keymap.set("n", "<Tab>ct", ":BufferLinePickClose<CR>")
keymap.set("n", "<Tab>c<Right>", ":BufferLineCloseRight<CR>")
keymap.set("n", "<Tab>c<Left>", ":BufferLineCloseLeft<CR>")
