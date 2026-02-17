local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- LSP Zero provides default keymaps
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

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
		"yamlls",
		"jsonls",
		"jdtls", -- Java
		"marksman", -- Markdown
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
		"isort",
		"stylua",
		"shfmt",
		"gofumpt",
		"eslint_d",
		"ruff",
		"mypy",
		"golangci-lint",
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

-- Configure Go LSP
require("lspconfig").gopls.setup({
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})

-- Configure YAML LSP for K8s
require("lspconfig").yamlls.setup({
	settings = {
		yaml = {
			schemas = {
				kubernetes = "/*.yaml",
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
				["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
				["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
			},
		},
	},
})
