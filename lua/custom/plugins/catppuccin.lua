return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'macchiato',
      term_colors = true,
      integrations = {
        notify = true,
        neotree = true,
        treesitter_context = true,
        lsp_trouble = true,
        which_key = true,
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
