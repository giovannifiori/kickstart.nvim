-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('fiori-lsp-attach', { clear = true }),
  callback = function(event)
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
    end

    nmap('<leader>rn', '<cmd>Lspsaga rename<CR>', '[R]e[n]ame')
    nmap('<leader>ca', '<cmd>Lspsaga code_action<CR>', '[C]ode [A]ction')

    nmap('gd', '<cmd>Lspsaga goto_definition<CR>', '[G]oto [D]efinition')
    nmap('<leader>pd', '<cmd>Lspsaga peek_definition<CR>', '[P]eek [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('<leader>pr', '<cmd>Lspsaga finder<CR>', '[P]eek [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('<leader>pD', '<cmd>Lspsaga peek_type_definition<CR>', '[P]eek Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>do', '<cmd>Lspsaga outline<CR>', '[D]ocument [O]utline')

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true)
    end
  end,
})

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. Available keys are:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
local servers = {
  gopls = {
    filetypes = {
      'go',
      'gomod',
    },
  },
  pyright = {},
  cssls = {},
  html = { filetypes = { 'html' } },
  tsserver = {
    settings = {
      single_file_support = false,
    },
  },
  eslint = {
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'svelte',
      'json',
      'jsonc',
    },
  },
  svelte = {},
  tailwindcss = {},
  dockerls = {},
  terraformls = {},
  jdtls = {},
  yamlls = {},
  marksman = {},
  emmet_ls = {
    filetypes = {
      'html',
      'css',
      'scss',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'svelte',
    },
  },
  lua_ls = {},
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
-- Ensure the servers above are installed
require('mason').setup {
  ui = {
    border = 'rounded',
  },
}
require('mason-lspconfig').setup {
  ensure_installed = vim.tbl_keys(servers),
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      require('lspconfig')[server_name].setup(server)
    end,
  },
}

-- specific to dart
require('lspconfig').dartls.setup {
  cmd = { 'dart', 'language-server', '--protocol=lsp' },
  capabilities = capabilities,
}

require('lspconfig.ui.windows').default_options.border = 'rounded'
