-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
    side = 'left',
  },
  filters = {
    dotfiles = false,
  },
  git = {
      enable = true,
  },
  renderer = {
      highlight_git = true,
      icons = {
          show = {
              git = true,
          },
      },
      group_empty = true,
  },
})