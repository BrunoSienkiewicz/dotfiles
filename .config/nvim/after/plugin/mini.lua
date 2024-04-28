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

-- Split window mappings
local map_split = function(buf_id, lhs, direction)
	local rhs = function()
		-- Make new window and set it as target
		local new_target_window
		vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
			vim.cmd(direction .. " split")
			new_target_window = vim.api.nvim_get_current_win()
		end)

		MiniFiles.set_target_window(new_target_window)
	end

	-- Adding `desc` will result into `show_help` entries
	local desc = "Split " .. direction
	vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		-- Tweak keys to your liking
		map_split(buf_id, "gs", "belowright horizontal")
		map_split(buf_id, "gv", "belowright vertical")
	end,
})

-- Hide entries
local show_dotfiles = true
local show_gitignore = true

local filter_show = function(fs_entry)
	return true
end

local filter_hide = function(fs_entry)
	return not vim.startswith(fs_entry.name, ".")
end

local filter_gitignore = function(fs_entry)
	local all_paths = table.concat(
		vim.tbl_map(function(entry)
			return entry.path
		end, fs_entry),
		"\n"
	)
	local output_lines = {}
	local job_id = vim.fn.jobstart({ "git", "check-ignore", "--stdin" }, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			output_lines = data
		end,
	})

	-- command failed to run
	if job_id < 1 then
		return fs_entry
	end

	-- send paths via STDIN
	vim.fn.chansend(job_id, all_paths)
	vim.fn.chanclose(job_id, "stdin")
	vim.fn.jobwait({ job_id })
	return minifiles.default_sort(vim.tbl_filter(function(entry)
		return not vim.tbl_contains(output_lines, entry.path)
	end, fs_entry))
end

local toggle_dotfiles = function()
	show_dotfiles = not show_dotfiles
	local new_filter = show_dotfiles and filter_show or filter_hide
	MiniFiles.refresh({ content = { filter = new_filter } })
end

local toggle_gitignore = function()
	show_gitignore = not show_gitignore
	local new_filter = show_gitignore and filter_gitignore or filter_show
	MiniFiles.refresh({ content = { filter = new_filter } })
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		-- Tweak left-hand side of mapping to your liking
		vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
		vim.keymap.set("n", "g/", toggle_gitignore, { buffer = buf_id })
	end,
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
	},
	content_hooks = {
		ministarter.gen_hook.adding_bullet(pad .. "░ ", false),
		ministarter.gen_hook.aligning("center", "center"),
	},
}

ministarter.setup(config)
