local keymap = vim.keymap
--------------------
--   normal-mod   --
--------------------
--编辑器保存退出
keymap.set("n", "<C-s>", ":w<cr>")
keymap.set("n", "<leader>w", ":w<cr>")
keymap.set("n", "<leader>q", ":q<cr>")
keymap.set("n", "<leader>W", ":wq<cr>")
keymap.set("n", "<leader>Q", ":q!<cr>")
--窗口操作
keymap.set("n", "s", "")
keymap.set("n", "<leader><Right>", ":vsp<CR>")
keymap.set("n", "<leader><Down>", ":sp<CR>")
keymap.set("n", "<leader><Left>", "<C-w>c")
keymap.set("n", "<leader><Up>", "<C-w>o")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-Left>", "<C-w>h")
keymap.set("n", "<C-Down>", "<C-w>j")
keymap.set("n", "<C-Up>", "<C-w>k")
keymap.set("n", "<C-Right>", "<C-w>l")
keymap.set("n", "<A-l>", ":vertical resize -2<CR>")
keymap.set("n", "<A-h>", ":vertical resize +2<CR>")
keymap.set("n", "<A-j>", ":resize +2<CR>")
keymap.set("n", "<A-k>", ":resize -2<CR>")
keymap.set("n", "<A-Right>", ":vertical resize -2<CR>")
keymap.set("n", "<A-Left>", ":vertical resize +2<CR>")
keymap.set("n", "<A-Down>", ":resize +2<CR>")
keymap.set("n", "<A-Up>", ":resize -2<CR>")
keymap.set("n", "<A-=>", "<C-w>=")
--打开终端
keymap.set("n", "<leader>t", ":sp term://powershell<CR>")
keymap.set("n", "<leader>vt", ":vsp term://powershell<CR>")
--行操作
keymap.set("n", "<Enter>", 'O<Esc>"_cc<Esc>j')
keymap.set("n", "<leader><Enter>", 'o<Esc>"_cc<Esc>')
keymap.set("n", "<leader>j", "J")
keymap.set("n", "<leader>k", "i<cr><Up><Esc>A")
--快速移动
keymap.set("n", "J", "5j")
keymap.set("n", "K", "5k")
keymap.set("n", "<S-Down>", "5j")
keymap.set("n", "<S-Up>", "5k")
--取消高亮
keymap.set("n", "<leader>/", ":noh<cr>")
--删除单字不复制
keymap.set("n", "x", '"_x')
--数字加减
keymap.set("n", "+", "<C-a>")
keymap.set("n", "_", "<C-x>")
--拼写检查
keymap.set("n", "<leader>sc", ":setlocal spell! spelllang=en_us<cr>")
--------------------
--   visual-mod   --
--------------------
--移动选中文本
keymap.set("v", "J", ":move '>+1<CR>gv-gv")
keymap.set("v", "K", ":move '<-2<CR>gv-gv")
keymap.set("v", "<S-Down>", ":move '>+1<CR>gv-gv")
keymap.set("v", "<S-Up>", ":move '<-2<CR>gv-gv")
--修复黏贴问题
keymap.set("v", "p", '"_dP')
keymap.set("v", "p", '"_dP')
----------------------
--   terminal-mod   --
----------------------
--终端窗口操作
keymap.set("t", "<C-h>", [[ <C-\><C-N><C-w>h ]])
keymap.set("t", "<C-j>", [[ <C-\><C-N><C-w>j ]])
keymap.set("t", "<C-k>", [[ <C-\><C-N><C-w>k ]])
keymap.set("t", "<C-l>", [[ <C-\><C-N><C-w>l ]])
keymap.set("t", "<C-Left>", [[ <C-\><C-N><C-w>h ]])
keymap.set("t", "<C-Down>", [[ <C-\><C-N><C-w>j ]])
keymap.set("t", "<C-Up>", [[ <C-\><C-N><C-w>k ]])
keymap.set("t", "<C-Right>", [[ <C-\><C-N><C-w>l ]])
