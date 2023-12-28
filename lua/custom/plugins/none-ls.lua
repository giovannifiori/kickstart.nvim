return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'

    -- autoformat
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    -- code action sources
    local code_actions = null_ls.builtins.code_actions
    -- diagnostic sources
    local diagnostics = null_ls.builtins.diagnostics
    -- formatting sources
    local formatting = null_ls.builtins.formatting

    null_ls.setup {
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format {
                async = false,
                bufnr = bufnr,
                filter = function(cli)
                  return cli.name == 'null-ls'
                end,
              }
            end,
          })
        end
      end,
      sources = {
        code_actions.eslint_d,
        code_actions.gitsigns,
        diagnostics.commitlint,
        diagnostics.eslint_d,
        diagnostics.golangci_lint,
        formatting.black,
        formatting.gofmt,
        formatting.isort,
        formatting.prettierd,
        formatting.templ,
        formatting.stylua,
      },
    }

    vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, { desc = '[F]ormat [f]ile' })
  end,
}
