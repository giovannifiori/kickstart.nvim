return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup {
      background_colour = '#000000',
      fps = 60,
    }
    vim.notify = require 'notify'
  end,
}
