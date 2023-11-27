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
					style = 'nvchad',
				},
			},
			styles = {
				comments = { "italic" }
			},
			transparent_background = true,
		})
		vim.cmd.colorscheme 'catppuccin-frappe'
	end
}
