return {
	'nvimtools/none-ls.nvim',
	config = function()
		local null_ls = require("null-ls")
		-- code action sources
		local code_actions = null_ls.builtins.code_actions

		-- diagnostic sources
		local diagnostics = null_ls.builtins.diagnostics

		-- formatting sources
		local formatting = null_ls.builtins.formatting
		null_ls.setup({
			sources = {
				code_actions.eslint_d,
				code_actions.gitsigns,
				diagnostics.commitlint,
				diagnostics.eslint_d,
				diagnostics.golangci_lint,
				formatting.black,
				formatting.gofmt,
				formatting.isort,
				formatting.prettierd,
				formatting.templ,
				formatting.stylua,
			}
		})
	end
}
