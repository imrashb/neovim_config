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
-- require("imrashb.plugins.evil_lualine")
require("lualine").setup({
	options = {
		theme = "tokyonight",
	},
	sections = {
		lualine_c = {
			{
				-- Lsp server name .
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icon = " LSP:",
				color = { fg = "#ffffff", gui = "bold" },
			},
		},
	},
})

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

-- Diff Colors
vim.cmd([[:highlight DiffAdd guibg=#24603b]])
vim.cmd([[:highlight DiffDelete guibg=#56283b]])
