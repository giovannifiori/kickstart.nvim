-- [[ Basic Keymaps ]]
vim.keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear [H]ighlights' })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Window keymaps
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { silent = true, desc = '[W]indow [S]plit' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { silent = true, desc = '[W]indow [V]ertical split' })
vim.keymap.set('n', '<C-x>', '<C-w>q', { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
-- Trouble
vim.keymap.set('n', '<leader>xx', function()
  require('trouble').toggle()
end, { desc = 'Toggle Trouble window' })
vim.keymap.set('n', '<leader>xw', function()
  require('trouble').toggle 'workspace_diagnostics'
end, { desc = 'Trouble [W]orkspace diagnostics' })
vim.keymap.set('n', '<leader>xd', function()
  require('trouble').toggle 'document_diagnostics'
end, { desc = 'Trouble [D]ocument diagnostics' })
vim.keymap.set('n', '<leader>xq', function()
  require('trouble').toggle 'quickfix'
end, { desc = 'Trouble [Q]uickfix' })
vim.keymap.set('n', '<leader>xl', function()
  require('trouble').toggle 'loclist'
end, { desc = 'Trouble [L]oclist' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
