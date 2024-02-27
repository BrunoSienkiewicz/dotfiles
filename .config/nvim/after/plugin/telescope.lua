local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local telescope = require('telescope')

telescope.setup{
    defaults = {
        layout_config = {
            prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
    },
    pickers = {
        find_files = {
            hidden = true,
            find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
            layout_config = {
                height = 0.70
            }
        },
    }
}
