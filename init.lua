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
		globalstatus = true,
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
					local array = {}
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							table.insert(array, client.name)
						end
					end
					if #array > 0 then
						return table.concat(array, ", ")
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
local colors = require("tokyonight.colors").setup()
require("scrollbar.handlers.gitsigns").setup()
require("scrollbar").setup({
	handle = {
		color = colors.bg_highlight,
	},
	marks = {
		Search = { color = colors.orange },
		Error = { color = colors.error },
		Warn = { color = colors.warning },
		Info = { color = colors.info },
		Hint = { color = colors.hint },
		Misc = { color = colors.purple },
	},
})
require("telescope").setup({
	pickers = {
		find_files = {
			hidden = true,
		},
		buffers = {
			initial_mode = "normal",
		},
		oldfiles = {
			cwd_only = true,
			initial_mode = "normal",
		},
	},
	defaults = {
		mappings = {
			n = {
				["<c-d>"] = require("telescope.actions").delete_buffer,
			},
		},
		path_display = function(opts, path)
			local tail = require("telescope.utils").path_tail(path)
			return string.format("%s  -  %s", tail, path), { { { 1, #tail }, "Constant" } }
		end,
	},
})

require("nvim-ts-autotag").setup({
	enable = true,
	enable_rename = true,
})

-- require("neotest").setup({
-- 	adapters = {
-- 		require("neotest-jest")({
-- 			jestCommand = "npm test --",
-- 			jestConfigFile = "custom.jest.config.ts",
-- 			env = { CI = true },
-- 			cwd = function(path)
-- 				return vim.fn.getcwd()
-- 			end,
-- 		}),
-- 	},
-- })

local nvim_tree_api = require("nvim-tree.api")
nvim_tree_api.tree.toggle_gitignore_filter()

-- LSP / LINTING / FORMATTING
require("imrashb.plugins.mason_lsps")
require("imrashb.plugins.mason_formatters")

vim.cmd.colorscheme("tokyonight-storm")

-- Diff Colors
vim.cmd([[:highlight DiffAdd guibg=#24603b]])
vim.cmd([[:highlight DiffDelete guibg=#56283b]])

-- require("diffview").setup({
-- 	hooks = {
-- 		diff_buf_win_enter = function(bufnr, winid, ctx)
-- 			if ctx.layout_name:match("^diff2") then
-- 				if ctx.symbol == "a" then
-- 					vim.cmd("hi DiffviewDiffDeleteChange guifg=none guibg=#4d2f36")
-- 					vim.cmd("hi DiffviewDiffDeleteText guifg=none guibg=#39292d")
-- 					vim.cmd("hi DiffviewDiffDeleteRemove guifg=#605e63 guibg=none")
-- 					vim.opt_local.winhl = table.concat({
-- 						"DiffAdd:DiffviewDiffAddAsDelete",
-- 						"DiffChange:DiffviewDiffDeleteChange",
-- 						"DiffText:DiffviewDiffDeleteText",
-- 						"DiffDelete:DiffviewDiffDeleteRemove",
-- 					}, ",")
-- 				elseif ctx.symbol == "b" then
-- 					vim.cmd("hi DiffviewDiffAddText guibg=#2c352e guifg=none")
-- 					vim.cmd("hi DiffviewDiffAddChange guibg=#2c352e guifg=none")
-- 					vim.cmd("hi DiffviewDiffAddDelete guifg=#605e63 guibg=none")
-- 					vim.opt_local.winhl = table.concat({
-- 						"DiffChange:DiffviewDiffAddChange",
-- 						"DiffText:DiffviewDiffAddText",
-- 						"DiffDelete:DiffviewDiffAddDelete",
-- 					}, ",")
-- 				end
-- 			end
-- 		end,
-- 	},
-- })
