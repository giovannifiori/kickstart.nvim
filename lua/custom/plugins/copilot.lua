return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
    cond = function()
      local cwd = vim.loop.cwd()
      return cwd ~= nil and (string.find(cwd, 'Jusbrasil') or string.find(cwd, '.config'))
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup {}
    end,
  },
}
