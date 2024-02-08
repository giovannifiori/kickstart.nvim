return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
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

    vim.keymap.set('n', '<leader>fe', ':Neotree toggle<CR>', { noremap = true, silent = true })
  end,
}
