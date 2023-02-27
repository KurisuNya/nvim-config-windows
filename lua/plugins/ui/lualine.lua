local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local lualine_theme = require("core.colorscheme").lualine
lualine.setup({
	options = {
		theme = lualine_theme,
		component_separators = { left = "|", right = "|" },
		-- https://github.com/ryanoasis/powerline-extra-symbols
		section_separators = { left = " ", right = "" },
	},
	extensions = { "nvim-tree", "toggleterm" },
	sections = {
		lualine_c = {
			"filename",
			{
				"lsp_progress",
				spinner_symbols = { " ", " ", " ", " ", " ", " " },
			},
		},
		lualine_x = {
			"filesize",
			{
				"fileformat",
				symbols = {
					unix = "LF ",
					dos = "CRLF ",
					mac = "CR ",
				},
			},
			"encoding",
			"filetype",
		},
	},
})
