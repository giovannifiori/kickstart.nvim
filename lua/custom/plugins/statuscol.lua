return {
  'luukvbaal/statuscol.nvim',
  config = function()
    local builtin = require 'statuscol.builtin'
    require('statuscol').setup {
      relculright = true,
      setopt = true,
      segments = {
        { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
        {
          sign = { name = { 'Diagnostic' }, maxwidth = 1, colwidth = 2, fillchar = ' ' },
          click = 'v:lua.ScSa',
        },
        { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa', sign = { maxwidth = 1, colwidth = 2, fillchar = ' ' } },
        {
          sign = { namespace = { 'gitsigns' }, maxwidth = 1, colwidth = 1 },
          click = 'v:lua.ScSa',
        },
      },
    }
  end,
}
