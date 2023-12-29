return {
  'nvim-pack/nvim-spectre',
  config = function()
    require('spectre').setup()

    vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', { desc = 'Toggle [S]pectre' })
  end,
}
