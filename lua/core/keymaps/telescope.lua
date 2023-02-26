-----------------
--  telescope  --
-----------------
local keymap = vim.keymap
--查找文件
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
--查找语句(全局)
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>")
--模糊查找(当前文件)
keymap.set("n", "<leader>fc", ":Telescope grep_string<cr>")
--查找标签
keymap.set("n", "<leader>fb", ":Telescope buffers<cr>")
--查找帮助
keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>")
--查找定义(全部标签内)
keymap.set("n", "<leader>fd", ":Telescope lsp_document_symbols<cr>")
--查找项目
keymap.set("n", "<leader>fp", ":Telescope projects<cr>")
--查看git-commit(全局)
keymap.set("n", "<leader>gc", ":Telescope git_commits<cr>")
--查看git-commit(当前文件)
keymap.set("n", "<leader>gfc", ":Telescope git_bcommits<cr>")
--查看git-branch
keymap.set("n", "<leader>gb", ":Telescope git_branches<cr>")
--查看git-status
keymap.set("n", "<leader>gs", ":Telescope git_status<cr>")
