return {
  'folke/zen-mode.nvim',
  config = function()
    require('zen-mode').setup {
      window = {
        width = 0.60,
      },
    }

    vim.keymap.set('n', '<leader>wz', ':ZenMode<CR>', { noremap = true, silent = true, desc = 'Toggle [W]indow [Z]enMode' })
  end,
}
