local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		require("none-ls.diagnostics.eslint_d"),
		require("none-ls.formatting.eslint_d"),
		-- null_ls.builtins.completion.spell,
		--require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "eslint_d" },
})
