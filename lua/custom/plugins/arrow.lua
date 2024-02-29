return {
  'otavioschwanck/arrow.nvim',
  config = function()
    require('arrow').setup {
      show_icons = true,
      leader_key = '\\',
      separate_by_branch = false,
    }

    vim.keymap.set('n', 'H', require('arrow.persist').previous, { desc = 'Arrow previous buffer' })
    vim.keymap.set('n', 'L', require('arrow.persist').next, { desc = 'Arrow next buffer' })
  end,
}
