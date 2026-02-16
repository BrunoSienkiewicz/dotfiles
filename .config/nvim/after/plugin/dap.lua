local dap = require("dap")
local dapui = require("dapui")

-- Setup DAP UI
dapui.setup()

-- Python debugging
require("dap-python").setup("python3")

-- Go debugging
require("dap-go").setup()

-- Auto open/close UI
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Keybindings for debugging (d = debug)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continue" })
vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: REPL" })
vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Debug: Toggle UI" })
