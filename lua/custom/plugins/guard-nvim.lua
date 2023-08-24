return {
	"nvimdev/guard.nvim",
	config = function()
		local ft = require('guard.filetype')
		ft('typescript,javascript,typescriptreact,javascriptreact'):fmt('prettier')

		require('guard').setup({
			fmt_on_save = true,
			lsp_as_default_formatter = true,
		})
	end
}
