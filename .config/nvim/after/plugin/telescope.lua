local telescope = require("telescope")

telescope.setup({
	defaults = {
		layout_config = {
			prompt_position = "top",
		},
		sorting_strategy = "ascending",
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
