-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'go',
      'lua',
      'python',
      'tsx',
      'typescript',
      'vimdoc',
      'vim',
      'json',
      'javascript',
      'yaml',
      'html',
      'css',
      'scss',
      'dockerfile',
      'bash',
      'svelte',
      'terraform',
      'java',
      'fish',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- List of parsers to ignore installing
    ignore_install = {},
    -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
    modules = {},
    autotag = {
      enable = true,
    },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter' },
          ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter' },
          ['if'] = { query = '@function.inner', desc = 'Select inner part of a function' },
          ['af'] = { query = '@function.outer', desc = 'Select outer part of a function' },
          ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
          ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
          ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
          ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },
          ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
          ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
          ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },
          ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
          ['ib'] = { query = '@block.inner', desc = 'Select inner part of a block' },
          ['ab'] = { query = '@block.outer', desc = 'Select outer part of a block' },
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']c'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']C'] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[c'] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[C'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }
  require('treesitter-context').setup {
    enable = true,
    multiline_threshold = 1,
  }

  local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

  -- vim way: ; goes to the direction you were moving.
  vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
  vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)
end, 0)
