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
		"yamlls",
		"jsonls",
		"dockerls",
		"terraform_lsp",
		"helm_ls",
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

-- YAML Language Server with Kubernetes schema support
lspconfig.yamlls.setup({
	settings = {
		yaml = {
			schemas = {
				kubernetes = "*.yaml",
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
				["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
				["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
				["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
				["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
				["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
				["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
				["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
				["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
			},
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
			format = {
				enable = true,
			},
			validate = true,
			completion = true,
			hover = true,
		},
	},
})

-- JSON Language Server with schema support
lspconfig.jsonls.setup({
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

-- Docker Language Server
lspconfig.dockerls.setup({})

-- Terraform Language Server
lspconfig.terraform_lsp.setup({})

-- Helm Language Server
lspconfig.helm_ls.setup({})

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
		"yamlls",
		"jsonls",
		"dockerls",
		"helm-ls",

		-- Formatters
		"black",
		"isort",
		"stylua",
		"gofumpt",
		"goimports",
		"prettier",
		"shfmt",

		-- Linters
		"pylint",
		"shellcheck",
		"yamllint",
		"golangci-lint",
	},
})
