local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = {
		-- lsp
		"rust_analyzer",
		"lua_ls",
		"bashls",
		"pyright",
		"tsserver",
		"clangd",
	},
	handlers = {
		lsp_zero.default_setup,
	},
})

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})
lspconfig.rust_analyzer.setup({
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		["rust-analyzer"] = {},
	},
})
lspconfig.clangd.setup({})

require("mason-tool-installer").setup({
	ensure_installed = {
		-- LSP
		"rust_analyzer",
		"lua_ls",
		"bashls",
		"pyright",
		"tsserver",
		"clangd",
		"bash-language-server",
		"lua-language-server",
		"vim-language-server",
		-- linters / formatters
		"golangci-lint",
		"stylua",
		"shellcheck",
		"editorconfig-checker",
		"shellcheck",
		"shfmt",
		"yamlfmt",
		"yamlls",
		"sqlls",
		"prettier",
		"stylua",
		"clang-format",
		"eslint_d",
	},
})
