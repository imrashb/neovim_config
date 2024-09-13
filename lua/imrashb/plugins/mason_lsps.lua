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

local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function filterReactDTS(value)
	return string.match(value.targetUri, "%.d.ts") == nil
end

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "tsserver", "tailwindcss", "clangd" },
	handlers = {
		function(server)
			lspconfig[server].setup({
				capabilities = lsp_capabilities,
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				end,
			})
		end,
		["ts_ls"] = function()
			local current_dir = vim.fn.getcwd()
			local init_options = {}

			-- If we are in a Sombra project, we want to use relative imports
			if current_dir:find("civalgo/sombra", 1, true) then
				init_options = {
					preferences = {
						importModuleSpecifierPreference = "relative",
						importModuleSpecifierEnding = "minimal",
					},
				}
			end
			lspconfig.ts_ls.setup({
				init_options = init_options,
				capabilities = lsp_capabilities,
				settings = {
					completions = {
						completeFunctionCalls = true,
					},
				},
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				end,
				handlers = {
					["textDocument/definition"] = function(err, result, method, ...)
						if vim.tbl_islist(result) and #result > 1 then
							local filtered_result = filter(result, filterReactDTS)
							return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
						end
						vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
					end,
				},
				root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
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
