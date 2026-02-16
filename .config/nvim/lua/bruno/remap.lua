vim.g.mapleader = " "

local builtin = require("telescope.builtin")

-- Find (f)
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find References" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Symbols" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git Files" })

-- LSP (l)
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Actions" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP Rename" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP Format" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

-- Git (g)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git Commit" })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git Push" })
vim.keymap.set("n", "<leader>gl", ":Git pull<CR>", { desc = "Git Pull" })

-- Splits
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Split Vertically" })
vim.keymap.set("n", "<leader>h", "<cmd>split<CR>", { desc = "Split Horizontally" })
vim.keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Split Close" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window Left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window Down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window Up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window Right" })

-- Buffers (b)
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Buffer Delete" })
vim.keymap.set("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Buffer Next" })
vim.keymap.set("n", "<leader>bp", "<cmd>bp<CR>", { desc = "Buffer Previous" })

-- File Explorer (e)
vim.keymap.set("n", "<C-b>", function()
	if not require("mini.files").close() then
		require("mini.files").open()
	end
end, { desc = "Toggle File Explorer" })

-- Search/Replace (s)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search Replace" })
vim.keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })

-- Clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank Line to Clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from Clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to Void" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without Yank" })

-- Quality of Life
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join Lines" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous Search" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex Mode" })
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Quickfix (q)
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Quickfix Open" })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Quickfix Close" })
vim.keymap.set("n", "<leader>qn", "<cmd>cnext<CR>zz", { desc = "Quickfix Next" })
vim.keymap.set("n", "<leader>qp", "<cmd>cprev<CR>zz", { desc = "Quickfix Previous" })

-- Toggles (t)
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle Wrap" })
vim.keymap.set("n", "<leader>tr", "<cmd>set relativenumber!<CR>", { desc = "Toggle Relative Numbers" })
