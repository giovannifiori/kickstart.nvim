return {
  'stevearc/overseer.nvim',
  config = function()
    require('overseer').setup {}

    vim.keymap.set('n', '<leader>tr', '<cmd>OverseerRun<CR>', { desc = '[T]ask Runner [R]un' })
    vim.keymap.set('n', '<leader>tt', '<cmd>OverseerRun<CR>', { desc = '[T]ask Runner [T]oggle' })
  end,
}
