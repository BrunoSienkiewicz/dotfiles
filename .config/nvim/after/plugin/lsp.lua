local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
-- see :help lsp-zero-keybindings
-- to learn the available actions
lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {
      -- lsp
      'rust_analyzer',
      'lua_ls',
      'bashls',
      'pyright',
      'tsserver',
      'clangd',
      -- -- formatters
      -- 'black',
      -- 'isort',
      -- 'prettier',
      -- 'stylua',
      -- 'clang-format',
      -- -- linters
      -- 'eslint_d',
      -- 'ruff',
    },
    handlers = {
      lsp_zero.default_setup,
    },
})

local lspconfig = require('lspconfig')

lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
lspconfig.clangd.setup {}

