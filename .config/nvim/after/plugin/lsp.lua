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
		"clangd",
		"gopls",
	},
	handlers = {
		lsp_zero.default_setup,
	},
})

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.pyright.setup({})
lspconfig.ts_ls.setup({})
lspconfig.rust_analyzer.setup({
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		["rust-analyzer"] = {},
	},
})
lspconfig.clangd.setup({})
lspconfig.gopls.setup({
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotimpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		-- LSP
		"rust_analyzer",
		"lua_ls",
		"bashls",
		"pyright",
		"clangd",
		"gopls",
		"bash-language-server",
		"lua-language-server",
		"vim-language-server",
		"terraform-ls",
	},
})
