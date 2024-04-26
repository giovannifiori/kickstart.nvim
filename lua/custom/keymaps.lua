-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- clear search highlights on Esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Incremet/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Window keymaps
vim.keymap.set('n', '<C-Left>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-Down>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-Up>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-Right>', '<C-w>l', { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', '<cmd>Lspsaga show_cursor_diagnostics<CR>', { desc = 'Show cursor diagnostics' })
vim.keymap.set('n', '<leader>le', '<cmd>Lspsaga show_line_diagnostics<CR>', { desc = 'Show line diagnostics' })
vim.keymap.set('n', '<leader>be', '<cmd>Lspsaga show_buf_diagnostics ++normal<CR>', { desc = 'Show buffer diagnostics' })
vim.keymap.set('n', '<leader>we', '<cmd>Lspsaga show_workspace_diagnostics ++normal<CR>', { desc = 'Show workspace diagnostics' })

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

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
})

vim.keymap.set('n', '<leader>rbg', function()
  local system_bg = 'light'
  local apple_interface_style = vim.fn.system 'defaults read -g AppleInterfaceStyle'
  if string.find(apple_interface_style, 'Dark') then
    system_bg = 'dark'
  end
  vim.o.bg = system_bg
end, { desc = '[R]efresh [b]ack[g]round' })
