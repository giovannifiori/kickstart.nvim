return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  config = function()
    require('neo-tree').setup {
      window = {
        position = 'right',
        mappings = {
          ['O'] = {
            command = function(state)
              local node = state.tree:get_node()
              local filepath = node.path
              local osType = vim.loop.os_uname().sysname
              local command
              if osType == 'Darwin' then
                command = 'open ' .. filepath
              else
                command = 'xdg-open ' .. filepath
              end
              os.execute(command)
            end,
            desc = "[O]pen file with system's default application",
          },
        },
      },
    }
    vim.keymap.set('n', '<leader>ft', '<cmd>Neotree reveal right toggle<CR>', { desc = 'Toggle [F]ile [T]ree' })
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
}
