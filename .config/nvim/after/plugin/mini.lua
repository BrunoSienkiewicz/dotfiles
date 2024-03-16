local minicursorword = require("mini.cursorword")

minicursorword.setup({
	delay = 0,
})

local minifiles = require("mini.files")

minifiles.setup({
	content = {},
	windows = {
		preview = true,
		width_preview = 80,
	},
	mappings = {
		go_in = "L",
		go_in_plus = "l",
	},
})

local ministarter = require("mini.starter")

local pad = string.rep(" ", 22)

local new_section = function(name, action, section)
	return { name = name, action = action, section = pad .. section }
end

local config = {
	evaluate_single = true,
	items = {
		new_section("Find file", "Telescope find_files", "Telescope"),
		new_section("Recent files", "Telescope oldfiles", "Telescope"),
		new_section("Grep text", "Telescope live_grep", "Telescope"),
		new_section("Config", "lua require('lazyvim.util').telescope.config_files()()", "Config"),
		new_section("Extras", "LazyExtras", "Config"),
		new_section("Lazy", "Lazy", "Config"),
		new_section("New file", "ene | startinsert", "Built-in"),
		new_section("Quit", "qa", "Built-in"),
		new_section("Session restore", [[lua require("persistence").load()]], "Session"),
	},
	content_hooks = {
		ministarter.gen_hook.adding_bullet(pad .. "░ ", false),
		ministarter.gen_hook.aligning("center", "center"),
	},
}

ministarter.setup(config)
