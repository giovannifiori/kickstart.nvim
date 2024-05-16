return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.surround').setup()
    require('mini.cursorword').setup()
    require('mini.indentscope').setup()
    require('mini.pairs').setup()
    require('mini.splitjoin').setup()
  end,
}
