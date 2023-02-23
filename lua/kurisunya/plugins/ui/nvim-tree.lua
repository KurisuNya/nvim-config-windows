local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("没有找到 nvim-tree")
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 列表操作快捷键
local list_keys = require("kurisunya.core.keymaps").nvimTreeList

nvim_tree.setup({
	create_in_closed_folder = false,
	respect_buf_cwd = false,
	auto_reload_on_write = true,
	disable_netrw = false,
	hijack_cursor = true,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = true,
	ignore_buffer_on_setup = false,
	open_on_setup = false,
	open_on_setup_file = false,
	open_on_tab = false,
	sort_by = "name",
	sync_root_with_cwd = true,
	view = {
		adaptive_size = false,
		centralize_selection = false,
		width = 30,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		hide_root_folder = false,
		float = {
			enable = false,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 30,
				row = 1,
				col = 1,
			},
		},
		-- 自定义列表中快捷键
		mappings = {
			custom_only = false,
			list = list_keys,
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = true,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "none",
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
		symlink_destination = true,
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "  ",
			},
		},
		root_folder_label = ":.:s?.*?/..?",
		icons = {
			webdev_colors = true,
			git_placement = "before",
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = true,
			},
			padding = " ",
			symlink_arrow = "  ",
		},
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	ignore_ft_on_setup = {},
	filters = {
		dotfiles = false,
		custom = { ".DS_Store" },
		exclude = {},
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
		},
		open_file = {
			quit_on_open = true,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = true,
		},
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
	},
	trash = {
		cmd = "gio trash",
		require_confirm = true,
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		debounce_delay = 50,
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		timeout = 400,
	},

	-- view = {
	-- 	-- 宽度
	-- 	width = 30,
	-- 	-- 也可以 'right'
	-- 	side = "left",
	-- 	-- 隐藏根目录
	-- 	hide_root_folder = false,
	-- 	-- 不显示行数
	-- 	number = false,
	-- 	relativenumber = false,
	-- 	-- 显示图标
	-- 	signcolumn = "yes",
	-- },
	-- actions = {
	-- 	open_file = {
	-- 		-- disable window_picker for
	-- 		-- explorer to work well with
	-- 		-- window splits
	-- 		window_picker = {
	-- 			enable = false,
	-- 		},
	-- 		-- 首次打开大小适配
	-- 		resize_window = true,
	-- 		-- 打开文件时关闭
	-- 		quit_on_open = true,
	-- 	},
	-- },
})

-- vim.cmd([[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]])
