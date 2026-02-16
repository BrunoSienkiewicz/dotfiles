local trouble = require("trouble")

trouble.setup({
	position = "bottom",
	height = 10,
	icons = true,
	mode = "workspace_diagnostics",
	fold_open = "",
	fold_closed = "",
	group = true,
	padding = true,
	action_keys = {
		close = "q",
		cancel = "<esc>",
		refresh = "r",
		jump = { "<cr>", "<tab>" },
		open_split = { "<c-x>" },
		open_vsplit = { "<c-v>" },
		open_tab = { "<c-t>" },
		jump_close = { "o" },
		toggle_mode = "m",
		toggle_preview = "P",
		hover = "K",
		preview = "p",
		close_folds = { "zM", "zm" },
		open_folds = { "zR", "zr" },
		toggle_fold = { "zA", "za" },
		previous = "k",
		next = "j",
	},
	indent_lines = true,
	auto_open = false,
	auto_close = false,
	auto_preview = true,
	auto_fold = false,
	signs = {
		error = "",
		warning = "",
		hint = "",
		information = "",
		other = "﫠",
	},
	use_diagnostic_signs = false,
})

-- Keybindings
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble" })
vim.keymap.set("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace Diagnostics" })
vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document Diagnostics" })
vim.keymap.set("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Quickfix" })
vim.keymap.set("n", "<leader>tl", "<cmd>TroubleToggle loclist<cr>", { desc = "Location List" })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { desc = "LSP References" })
