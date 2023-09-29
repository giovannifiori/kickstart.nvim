return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require('guard.filetype')
		ft('typescript,javascript,typescriptreact,javascriptreact'):fmt('prettier') --[[:append({
			cmd = 'pnpm',
			args = { 'exec', 'prettier', '--stdin-filepath' },
			fname = true,
			stdin = true,
		})]]

		require('guard').setup({
			fmt_on_save = true,
			lsp_as_default_formatter = true,
		})
	end
}
