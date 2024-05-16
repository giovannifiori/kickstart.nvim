return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {}
  end,
  cond = function()
    local cwd = vim.loop.cwd()
    return cwd ~= nil and (string.find(cwd, 'Jusbrasil') or string.find(cwd, '.config'))
  end,
}
