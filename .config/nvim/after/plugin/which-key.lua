local wk = require("which-key")

wk.setup({
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = true,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
})

-- Document existing key chains
wk.register({
	["<leader>f"] = { name = "Find/Telescope" },
	["<leader>g"] = { name = "Git" },
	["<leader>d"] = { name = "Debug" },
	["<leader>l"] = { name = "LSP" },
	["<leader>t"] = { name = "Trouble/Diagnostics" },
	["<leader>s"] = { name = "Session" },
})
