require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "tsserver", "eslint" },
	handlers = {
		function(server)
			lspconfig[server].setup({
				capabilities = lsp_capabilities,
			})
		end,
		["tsserver"] = function()
			lspconfig.tsserver.setup({
				capabilities = lsp_capabilities,
				settings = {
					completions = {
						completeFunctionCalls = true,
					},
				},
			})
		end,
	},
})

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
