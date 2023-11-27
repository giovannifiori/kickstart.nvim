return {
	"folke/noice.nvim",
	event = "VeryLazy",
	config = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				command_palette = true, -- position the cmdline and popupmenu together
				lsp_doc_border = true, -- add a border to hover docs and signature help
				long_message_to_split = true,
			},
			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available"
					},
					opts = { skip = true },
				},
			}
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify"
	}
}
