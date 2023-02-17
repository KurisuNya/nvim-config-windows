------ keymap-setting ------
local keymap = vim.keymap
local pluginKeys = {}
----------------------------

---------------------------
--                       --
--    default-setting    --
--                       --
---------------------------
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
--   insert-mod   --
--------------------
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

--------------------------
--                      --
--    plugin-setting    --
--                      --
--------------------------
------------------
--  bufferline  --
------------------
--切换标签
keymap.set("n", "<Tab><Left>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<Tab><Right>", ":BufferLineCycleNext<CR>")
-- 打开标签
keymap.set("n", "<Tab>n", ":tabnew<CR>")
-- 关闭标签
keymap.set("n", "<Tab>cc", ":Bdelete!<CR>")
keymap.set("n", "<Tab>ct", ":BufferLinePickClose<CR>")
keymap.set("n", "<Tab>c<Right>", ":BufferLineCloseRight<CR>")
keymap.set("n", "<Tab>c<Left>", ":BufferLineCloseLeft<CR>")
-----------------
--  telescope  --
-----------------
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
-----------
--  hop  --
-----------
--单词跳转
keymap.set("n", "<leader><leader>w", ":HopWordMW<cr>")
--两字跳转
keymap.set("n", "s", ":HopChar2MW<cr>")
--行跳转
keymap.set("n", "<leader><leader>l", ":HopLine<cr>")
---------------------
--  vim-maximizer  --
---------------------
keymap.set("n", "<leader>ms", ":MaximizerToggle<CR>")
------------------------
--  markdown-preview  --
------------------------
keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>")
----------------
--  troubles  --
----------------
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
------------------
--  git-sigins  --
------------------
keymap.set(
	"n",
	"<leader>gfs",
	"<cmd>Gitsigns toggle_linehl<cr><cmd>Gitsigns toggle_numhl<cr><cmd>Gitsigns toggle_deleted<cr><cmd>Gitsigns toggle_word_diff<cr>"
)
-----------------
--  nvim-tree  --
-----------------
--开关
keymap.set("n", "<leader><Tab>", ":NvimTreeToggle<CR>")
--快捷键
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "y", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}
return pluginKeys
