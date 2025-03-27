local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		require("none-ls.diagnostics.eslint_d"),
		require("none-ls.code_actions.eslint_d"),
		require("none-ls.formatting.eslint_d"),
		-- null_ls.builtins.completion.spell,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						async = false,
						filter = function(cl)
							return cl.name ~= "ts_ls" -- Don't use tsserver for formatting, use null_ls
						end,
					})
				end,
			})
		end
	end,
})

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "eslint_d", "prettierd" },
})
