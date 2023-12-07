return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	config = function()
		require('catppuccin').setup({
			integrations = {
				barbecue = {
					dim_dirname = true, -- directory name is dimmed by default
					bold_basename = true,
					dim_context = false,
					alt_background = false,
				},
				gitsigns = true,
				illuminate = true,
				indent_blankline = {
					enabled = true,
					scope_color = "text",
					colored_indent_levels = false,
				},
				telescope = {
					enabled = true,
				},
			},
			styles = {
				comments = { "italic" },
				keywords = { "italic" },
			},
		})
		vim.cmd.colorscheme 'catppuccin-mocha'
	end
}
