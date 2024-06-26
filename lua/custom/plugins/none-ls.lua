return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'

    -- autoformat
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

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
        diagnostics.commitlint,
        diagnostics.golangci_lint,
        formatting.black,
        formatting.dart_format,
        formatting.gofmt,
        formatting.isort,
        formatting.prettierd,
        formatting.stylua,
      },
    }

    vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, { desc = '[F]ormat [f]ile' })
  end,
}
