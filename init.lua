-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.copilot_assume_mapped = true

-- netrw config
vim.g.netrw_banner = 0       -- remove banner
vim.g.netrw_liststyle = 3    -- tree like style
vim.g.netrw_browse_split = 4 -- open in previous window
vim.g.netrw_altv = 1         -- open splits to the right
vim.g.netrw_winsize = 25     -- set width % of netrw window

require('lazy-setup')

require('lazy-plugins')

require('custom.options')

require('custom.keymaps')

require('telescope-setup')

require('treesitter-setup')

require('lsp-setup')

require('cmp-setup')

require('ibl').setup({
  indent = {
    char = '┊',
  },
  whitespace = {
    remove_blankline_trail = false
  }
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
