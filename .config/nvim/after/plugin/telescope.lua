local telescope = require("telescope")

telescope.setup({
	defaults = {
		layout_config = {
			prompt_position = "top",
			height = 0.9,
			width = 0.9,
			preview_cutoff = 120,
		},
		sorting_strategy = "ascending",
		scroll_strategy = "cycle",
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			additional_args = function()
				return { "--hidden" }
			end,
		},
	},
})
