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
	require("imrashb.plugins.tree"),
	require("imrashb.plugins.telescope"),
	require("imrashb.plugins.whichkey"),
	require("imrashb.plugins.mason"),
	require("imrashb.plugins.cmp"),
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "lewis6991/gitsigns.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "sindrets/diffview.nvim" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{ "f-person/git-blame.nvim" },
}
