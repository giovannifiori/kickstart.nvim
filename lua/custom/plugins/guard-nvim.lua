return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require('guard.filetype')
		ft('typescript,javascript,typescriptreact,javascriptreact,json')
		    :fmt('prettier')

		ft('python'):fmt('isort'):append('black')

		require('guard').setup({
			fmt_on_save = true,
			lsp_as_default_formatter = true,
		})
	end
}
