return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup {
      code_action = {
        show_server_name = true,
        extend_gitsigns = true,
      },
      lightbulb = {
        enable = false,
      },
      rename = {
        in_select = false,
      },
    }
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons', -- optional
  },
}
