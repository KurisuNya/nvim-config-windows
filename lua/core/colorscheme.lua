------------------
-- colorscheme  --
------------------
local status, tokyonight = pcall(require, "tokyonight")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
tokyonight.setup({
	style = "storm",
	dim_inactive = true,
	lualine_bold = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = true },
	},
})
local colorscheme = "tokyonight-storm"
vim.api.nvim_command("colorscheme " .. colorscheme)
