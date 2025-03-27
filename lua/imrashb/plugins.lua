return {
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "numToStr/Comment.nvim", opts = {} },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "lewis6991/gitsigns.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"sindrets/diffview.nvim",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{ "f-person/git-blame.nvim" },
	{ "windwp/nvim-ts-autotag" },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"github/copilot.vim",
	},
	{
		"petertriho/nvim-scrollbar",
	},
	{
		"antosha417/nvim-lsp-file-operations",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
	},
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	dependencies = {
	-- 		"nvim-neotest/nvim-nio",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"antoinemadec/FixCursorHold.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	--      "nvim-neotest/neotest-jest"
	-- 	},
	-- },

	require("imrashb.plugins.tree"),
	require("imrashb.plugins.telescope"),
	require("imrashb.plugins.whichkey"),
	require("imrashb.plugins.mason"),
	require("imrashb.plugins.cmp"),
	require("imrashb.plugins.treesitter"),
	require("imrashb.plugins.codecompanion"),
}
