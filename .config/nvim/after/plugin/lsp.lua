local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- LSP Zero provides default keymaps
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- Mason Setup
require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- Auto-install LSP servers
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"bashls",
		"pyright",
		"rust_analyzer",
		"gopls",
		"clangd",
		"ts_ls",
	},
	handlers = {
		lsp_zero.default_setup,
	},
})

-- Mason Tool Installer for formatters and linters
require("mason-tool-installer").setup({
	ensure_installed = {
		-- Formatters
		"prettier",
		"black",
		"stylua",
		"shfmt",
		-- Linters
		"eslint_d",
		"pylint",
	},
	auto_update = false,
	run_on_start = true,
})

-- Configure Lua LSP for Neovim development
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
