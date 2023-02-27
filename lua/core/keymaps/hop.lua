-----------
--  hop  --
-----------
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
--单词跳转
keymap.set("n", "<leader><leader>w", ":HopWordMW<cr>", opts)
--两字跳转
keymap.set("n", "s", ":HopChar2MW<cr>", opts)
--行跳转
keymap.set("n", "<leader><leader>l", ":HopLine<cr>", opts)
