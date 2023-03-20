-----------------
--  nvim-tree  --
-----------------
--开关
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
--快捷键
return {
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	{ key = "i", action = "cd" },
	{ key = "u", action = "dir_up" },
	{ key = "g", action = "toggle_custom" }, -- Hide (dotfiles)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "y", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}
