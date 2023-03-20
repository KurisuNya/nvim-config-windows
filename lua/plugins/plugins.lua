return {
	--dependence
	"nvim-lua/plenary.nvim",
	"kkharji/sqlite.lua",
	--theme
	"folke/tokyonight.nvim",
	"rebelot/kanagawa.nvim",
	"sainnhe/everforest",
	{ "catppuccin/nvim", name = "catppuccin" },
	--ui
	"moll/vim-bbye",
	"kyazdani42/nvim-web-devicons",
	"onsails/lspkind.nvim",
	"akinsho/bufferline.nvim",
	"nvim-lualine/lualine.nvim",
	"arkav/lualine-lsp-progress",
	"lukas-reineke/indent-blankline.nvim",
	"p00f/nvim-ts-rainbow",
	"RRethy/vim-illuminate",
	--cmp
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"windwp/nvim-autopairs",
	"lukas-reineke/cmp-under-comparator",
	"windwp/nvim-ts-autotag",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-cmdline",
	"f3fora/cmp-spell",
	"hrsh7th/cmp-nvim-lua",
	"saadparwaiz1/cmp_luasnip",
	--lsp
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"glepnir/lspsaga.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",
	"folke/trouble.nvim",
	"mfussenegger/nvim-jdtls",
	"folke/neodev.nvim",
	--tool
	{
		"AbaoFromCUG/dashboard-nvim",
		event = "VeryLazy",
	},
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
	},
	{
		"kyazdani42/nvim-tree.lua",
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		event = "VeryLazy",
	},
	{
		"debugloop/telescope-undo.nvim",
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		event = "VeryLazy",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
	},
	{
		"szw/vim-maximizer",
		event = "VeryLazy",
	},
	{
		"machakann/vim-highlightedyank",
		event = "VeryLazy",
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},
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
		event = "VeryLazy",
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
	},
	{
		"nvim-pack/nvim-spectre",
		event = "VeryLazy",
	},
	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
	{
		"max397574/better-escape.nvim",
		event = "VeryLazy",
	},
	{
		"phaazon/hop.nvim",
		branch = "v2",
		event = "VeryLazy",
	},
	{
		"bkad/CamelCaseMotion",
		event = "VeryLazy",
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
	},
	{
		"andymass/vim-matchup",
		event = "VeryLazy",
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
	},
}
