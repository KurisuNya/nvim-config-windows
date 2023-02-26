return {
	--依赖
	"nvim-lua/plenary.nvim",
	--主题
	"folke/tokyonight.nvim",
	"ayu-theme/ayu-vim",
	--UI
	"moll/vim-bbye",
	"kyazdani42/nvim-tree.lua",
	"kyazdani42/nvim-web-devicons",
	"akinsho/bufferline.nvim",
	"nvim-lualine/lualine.nvim",
	"arkav/lualine-lsp-progress",
	"AbaoFromCUG/dashboard-nvim",
	"onsails/lspkind.nvim",
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				space_char_blankline = " ",
				show_current_context = true,
			})
		end,
	},
	{
		"p00f/nvim-ts-rainbow",
		dependencies = "nvim-treesitter",
	},
	"RRethy/vim-illuminate",
	"lewis6991/gitsigns.nvim",
	--自动补全
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"windwp/nvim-autopairs",
	"lukas-reineke/cmp-under-comparator",
	"hrsh7th/cmp-cmdline",
	"f3fora/cmp-spell",
	"hrsh7th/cmp-nvim-lua",
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter",
	},
	--LSP
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	"neovim/nvim-lspconfig",
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("lspsaga").setup({})
		end,
	},
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",
	"folke/trouble.nvim",
	"mfussenegger/nvim-jdtls",
	"folke/neodev.nvim",
	--功能性
	"ahmedkhalf/project.nvim",
	"nvim-telescope/telescope.nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"szw/vim-maximizer",
	"machakann/vim-highlightedyank",
	"tpope/vim-surround",
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	},
	"sindrets/diffview.nvim",
	"nvim-pack/nvim-spectre",
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"rainbowhxch/accelerated-jk.nvim",
		config = function()
			require("accelerated-jk").setup({
				mode = "time_driven",
				enable_deceleration = false,
				acceleration_motions = {},
				acceleration_limit = 60,
				acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
				-- when 'enable_deceleration = true', 'deceleration_table = { {200, 3}, {300, 7}, {450, 11}, {600, 15}, {750, 21}, {900, 9999} }'
				deceleration_table = { { 60, 9999 } },
			})
		end,
	},
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				mapping = { "jk", "jj" }, -- a table with mappings to use
				timeout = 400, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
				clear_empty_lines = false, -- clear line after escaping if there is only whitespace
				keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
			})
		end,
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	config = function()
	-- 		require("noice").setup({
	-- 			lsp = {
	-- 				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
	-- 				override = {
	-- 					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	-- 					["vim.lsp.util.stylize_markdown"] = true,
	-- 					["cmp.entry.get_documentation"] = true,
	-- 				},
	-- 			},
	-- 			-- you can enable a preset for easier configuration
	-- 			presets = {
	-- 				bottom_search = true, -- use a classic bottom cmdline for search
	-- 				command_palette = true, -- position the cmdline and popupmenu together
	-- 				long_message_to_split = true, -- long messages will be sent to a split
	-- 				inc_rename = false, -- enables an input dialog for inc-rename.nvim
	-- 				lsp_doc_border = false, -- add a border to hover docs and signature help
	-- 			},
	-- 		})
	-- 	end,
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- },
	--快捷操作
	{
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("hop").setup({})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
}
