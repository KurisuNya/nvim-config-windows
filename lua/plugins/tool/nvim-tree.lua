local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 列表操作快捷键
local keys = require("core.keymaps").nvim_tree
nvim_tree.setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	create_in_closed_folder = false,
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
			list = keys,
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
})

local auto_quit =
	"autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"
vim.api.nvim_command(auto_quit)
