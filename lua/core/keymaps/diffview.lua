----------------
--  diffview  --
----------------
local keymap = vim.keymap
keymap.set("n", "<leader>vd", "<cmd>DiffviewOpen<CR>")
keymap.set("n", "<leader>cd", "<cmd>DiffviewClose<CR>")
keymap.set("n", "<leader>vfh", "<cmd>DiffviewFileHistory<CR>")
