-- ============================================================================
-- Treesitter - Better syntax highlighting and code understanding
-- ============================================================================
require("nvim-treesitter.configs").setup({
	-- Auto-install parsers for these languages
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"query",
		"python",
		"javascript",
		"typescript",
		"tsx",
		"json",
		"html",
		"css",
		"bash",
		"markdown",
		"markdown_inline",
		"rust",
		"go",
		"c",
		"cpp",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- Highlighting
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	-- Indentation
	indent = {
		enable = true,
	},

	-- Incremental selection
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},

	-- Text objects
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]C"] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[C"] = "@class.outer",
			},
		},
	},
})
