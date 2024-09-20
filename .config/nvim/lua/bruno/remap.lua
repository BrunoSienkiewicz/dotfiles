vim.g.mapleader = " "

-- greatest remap ever
vim.keymap.set("x", "<leader>dp", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>pp", "<nop>")
vim.keymap.set("n", "<leader>P", [["+P]])
vim.keymap.set("n", "<leader>PP", "<nop>")

vim.keymap.set({ "n", "v" }, "<leader>dd", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- Navigating
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")

-- Splitting
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>split<CR>")

-- Increment and decrement numbers
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- -- Press 'U' for redo
vim.keymap.set("n", "U", "<C-r>")

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>dg", function()
	vim.diagnostic.open_float({
		border = "rounded",
	})
end)
vim.keymap.set("n", ",C-k>", function()
	vim.diagnostic.goto_prev()
end)
vim.keymap.set("n", ",C-j>", function()
	vim.diagnostic.goto_next()
end)
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setqflist)
vim.keymap.set("n", "<leader>lca", function()
	vim.lsp.buf.code_action()
end)
vim.keymap.set("n", "<leader>lrr", function()
	vim.lsp.buf.references()
end)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

-- QFList
vim.keymap.set("n", "<leader>co", ":copen<cr>zz")
vim.keymap.set("n", "<leader>cc", ":cclose<cr>zz")

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", function()
	builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
end)
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Harpoon
vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file)
vim.keymap.set("n", "<C-e>", require("harpoon.ui").toggle_quick_menu)

-- MiniFiles
vim.keymap.set("n", "<C-b>", function()
	if not require("mini.files").close() then
		require("mini.files").open()
	end
end)
vim.keymap.set("n", "<ESC>", function()
	require("mini.files").close()
end)

-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>")
