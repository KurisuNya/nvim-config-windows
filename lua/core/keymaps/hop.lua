-----------
--  hop  --
-----------
local keymap = vim.keymap
--单词跳转
keymap.set("n", "<leader><leader>w", ":HopWordMW<cr>")
--两字跳转
keymap.set("n", "s", ":HopChar2MW<cr>")
--行跳转
keymap.set("n", "<leader><leader>l", ":HopLine<cr>")
