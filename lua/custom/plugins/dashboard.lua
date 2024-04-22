return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      change_to_vcs_root = true,
      config = {
        header = {
          ' ',
          ' ',
          ' ',
          '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       ██████╗ ████████╗██╗    ██╗',
          '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║       ██╔══██╗╚══██╔══╝██║    ██║',
          '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║       ██████╔╝   ██║   ██║ █╗ ██║',
          '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║       ██╔══██╗   ██║   ██║███╗██║',
          '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║▄█╗    ██████╔╝   ██║   ╚███╔███╔╝',
          '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝    ╚═════╝    ╚═╝    ╚══╝╚══╝ ',
          ' ',
          ' ',
          ' ',
        },
        center = {
          { icon = '📦 ', desc = 'Package Manager', group = 'Label', action = 'Lazy', key = 'p' },
          { icon = '🔍 ', desc = 'Find Files', group = 'Label', action = 'Telescope find_files', key = 'f' },
          { icon = '📁 ', desc = 'File Browser', group = 'Label', action = 'Telescope file_browser', key = 'b' },
        },
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
