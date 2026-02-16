# Contributing

This is a personal configuration, but you're welcome to fork and customize it.

## Making Changes

**Test first**: Use Docker or VM (see [TESTING.md](TESTING.md))

**Adding plugins**:
- Neovim: Add to `.config/nvim/lua/bruno/lazy.lua`
- Tmux: Add to `.config/tmux/tmux.conf`
- ZSH: Clone to `.config/zsh/plugins/` and source in `.zshrc`

**Keybinding conventions**:
- Use `<leader>` prefix
- Group by first letter (f=find, l=lsp, g=git)
- Add descriptions: `{ desc = "Action Name" }`

**Code style**:
- Lua: tabs, 4 spaces
- Shell: tabs, 4 spaces
- Config files: spaces, 2 spaces

## Customization Ideas

- Change Catppuccin flavor
- Add language servers in `lsp.lua`
- Add formatters in `conform.lua`
- Create custom aliases in `.aliases`
- Add tmux session scripts

## Philosophy

Keep it:
- **Minimal**: Essential tools only
- **Fast**: Quick startup times
- **Intuitive**: Easy keybindings
- **Cross-platform**: Linux + macOS

## License

MIT - Fork and customize freely!
