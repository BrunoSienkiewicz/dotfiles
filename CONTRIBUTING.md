# Contributing to Dotfiles

Thank you for your interest in this dotfiles configuration! While this is a personal configuration, you're welcome to fork it and customize it for your own needs.

## Making Changes

### Testing Your Changes

1. **Always test in a safe environment first**
   - Use a VM or container
   - Or backup your current configs before testing

2. **Test incrementally**
   - Test shell config: `zsh -c 'echo "Shell works"'`
   - Test nvim config: `nvim --headless +qall` (should exit cleanly)
   - Test tmux config: `tmux -f ~/.config/tmux/tmux.conf new-session -d 'echo test' \; kill-session`

### Adding Plugins

**Neovim:**
- Add to `.config/nvim/lua/bruno/lazy.lua`
- Create config in `.config/nvim/after/plugin/[plugin-name].lua`

**Tmux:**
- Add to `.config/tmux/tmux.conf` in the plugins section
- Configure below in the plugin configuration section

**ZSH:**
- Clone plugin to `.config/zsh/plugins/`
- Source in `.config/zsh/.zshrc`

### Keybinding Conventions

When adding keybindings to Neovim:
- Use `<leader>` for most custom mappings
- Group by first letter (f=find, l=lsp, g=git, etc.)
- Always add a description with `desc`
- Keep it intuitive and memorable

Example:
```lua
vim.keymap.set("n", "<leader>fx", builtin.my_function, { desc = "Find X" })
```

### Code Style

- **Lua**: Use tabs, 4 spaces
- **Shell scripts**: Use tabs, 4 spaces
- **Config files**: Use spaces, 2 spaces
- Add comments for complex configurations
- Group related settings together

### Documentation

When making significant changes:
1. Update README.md if it affects usage
2. Update inline comments in config files
3. Test that your changes work on both Linux and macOS (if applicable)

## Customization Ideas

Here are some areas you might want to customize:

### Theme
- Change Catppuccin flavor in nvim and tmux configs
- Or switch to a different colorscheme entirely

### Additional Tools
- Add more language servers in `lsp.lua`
- Add more formatters in `conform.lua`
- Add custom aliases in `.aliases`

### Workflow Optimizations
- Add project-specific tmux session scripts
- Create custom telescope pickers
- Add more git integrations

## Reporting Issues

If you find issues with the base configuration:
1. Check if it's a plugin issue first
2. Verify it happens with a clean install
3. Open an issue with:
   - Your OS and version
   - Steps to reproduce
   - Expected vs actual behavior

## Philosophy

This configuration aims to be:
- **Minimal**: Only essential tools
- **Fast**: Quick startup times
- **Intuitive**: Easy to remember keybindings
- **Cross-platform**: Works on Linux and macOS
- **Well-documented**: Clear README and inline comments

When suggesting changes, please keep these principles in mind.

## License

MIT License - Feel free to fork, modify, and share!
