-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local action_layout = require 'telescope.actions.layout'
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { 'node_modules', '.git/' },
    sorting_strategy = 'ascending',
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        prompt_position = 'top',
        mirror = true,
      },
    },
    mappings = {
      n = {
        ['<M-p>'] = action_layout.toggle_preview,
      },
      i = {
        ['<M-p>'] = action_layout.toggle_preview,
      },
    },
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
      hidden = {
        file_browser = true,
        folder_browser = true,
      },
      prompt_path = true,
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {},
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      hidden = true,
    },
  },
}

-- Enable telescope extensions, if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'file_browser')
pcall(require('telescope').load_extension, 'ui-select')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end
vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').search_history, { desc = '[S]earch [H]istory' })
vim.keymap.set('n', '<leader>ch', require('telescope.builtin').command_history, { desc = '[C]ommand [H]istory' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = '[F]ile [B]rowser' })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits, { desc = '[G]it [C]ommits' })
vim.keymap.set('n', '<leader>gbc', require('telescope.builtin').git_bcommits, { desc = '[G]it [B]uffer [C]ommits' })
