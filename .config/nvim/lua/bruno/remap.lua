vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>dp", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

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

vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")

-- -- Press 'U' for redo
vim.keymap.set("n", "U", "<C-r>")

-- LSP
vim.keymap.set("n", "<leader>dg", function()
	vim.diagnostic.open_float({
		border = "rounded",
	})
end)
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setqflist)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
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
