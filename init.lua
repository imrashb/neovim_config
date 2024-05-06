-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("imrashb.plugins"))

require("imrashb.options")
require("imrashb.keybinds")
require("imrashb.plugins.evil_lualine")
require("gitblame").setup()

require("colorizer").setup()
require("gitsigns").setup()
require("telescope").setup({
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

local nvim_tree_api = require("nvim-tree.api")
nvim_tree_api.tree.toggle_gitignore_filter()

-- LSP / LINTING / FORMATTING
require("imrashb.plugins.mason_lsps")
require("imrashb.plugins.mason_formatters")

vim.cmd.colorscheme("tokyonight-storm")
