-- ============================================================================
-- Mini.cursorword - Highlight word under cursor
-- ============================================================================
require("mini.cursorword").setup({
	delay = 100,
})

-- ============================================================================
-- Mini.files - File Explorer
-- ============================================================================
local minifiles = require("mini.files")

minifiles.setup({
	windows = {
		preview = true,
		width_preview = 50,
	},
	mappings = {
		go_in = "L",
		go_in_plus = "l",
	},
})

-- Split window mappings for mini.files
local map_split = function(buf_id, lhs, direction)
	local rhs = function()
		local new_target_window
		vim.api.nvim_win_call(MiniFiles.get_explorer_state().target_window, function()
			vim.cmd(direction .. " split")
			new_target_window = vim.api.nvim_get_current_win()
		end)
		MiniFiles.set_target_window(new_target_window)
	end

	vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = "Split " .. direction })
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		map_split(buf_id, "gs", "belowright horizontal")
		map_split(buf_id, "gv", "belowright vertical")
	end,
})

-- Toggle dotfiles visibility
local show_dotfiles = true

local filter_show = function(fs_entry)
	return true
end

local filter_hide = function(fs_entry)
	return not vim.startswith(fs_entry.name, ".")
end

local toggle_dotfiles = function()
	show_dotfiles = not show_dotfiles
	local new_filter = show_dotfiles and filter_show or filter_hide
	MiniFiles.refresh({ content = { filter = new_filter } })
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id, desc = "Toggle Dotfiles" })
	end,
})
