return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'macchiato',
      transparent_background = true,
      term_colors = true,
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      integrations = {
        notify = true,
        neotree = true,
        noice = true,
        treesitter_context = true,
        lsp_trouble = true,
        which_key = true,
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
