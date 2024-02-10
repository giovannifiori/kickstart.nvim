return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():append()
    end, { desc = '[H]arpoon [a]ppend' })
    vim.keymap.set('n', '<leader>hl', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon [l]ist' })

    vim.keymap.set('n', '<leader>b1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon select buffer 1' })
    vim.keymap.set('n', '<leader>b2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon select buffer 2' })
    vim.keymap.set('n', '<leader>b3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon select buffer 3' })
    vim.keymap.set('n', '<leader>b4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon select buffer 4' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>bp', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon previous buffer' })
    vim.keymap.set('n', '<leader>bn', function()
      harpoon:list():next()
    end, { desc = 'Harpoon next buffer' })
  end,
}
