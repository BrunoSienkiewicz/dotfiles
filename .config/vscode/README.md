# VS Code Configuration

This directory contains VS Code settings that match the Neovim configuration in this dotfiles repository.

## Setup

VS Code settings can be configured either globally or per-user. This configuration is designed to provide a consistent experience across all editors.

### Option 1: User Settings (Recommended)

Copy the settings to your VS Code user settings directory:

**Linux:**
```bash
cp ~/.dotfiles/.config/vscode/settings.json ~/.config/Code/User/settings.json
```

**macOS:**
```bash
cp ~/.dotfiles/.config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

### Option 2: Symlink (Alternative)

Create a symlink to keep settings in sync:

**Linux:**
```bash
ln -sf ~/.dotfiles/.config/vscode/settings.json ~/.config/Code/User/settings.json
```

**macOS:**
```bash
ln -sf ~/.dotfiles/.config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

## Required Extensions

To get the full experience matching Neovim, install these extensions:

### Theme
- **Catppuccin for VSCode** (`Catppuccin.catppuccin-vsc`) - Matches the Neovim theme

### Essential
- **Python** (`ms-python.python`) - Python language support
- **Black Formatter** (`ms-python.black-formatter`) - Python formatting
- **isort** (`ms-python.isort`) - Python import sorting
- **Go** (`golang.go`) - Go language support
- **Prettier** (`esbenp.prettier-vscode`) - JavaScript/TypeScript formatting
- **YAML** (`redhat.vscode-yaml`) - YAML support

### Optional but Recommended
- **GitLens** (`eamodio.gitlens`) - Enhanced Git integration
- **Better Comments** (`aaron-bond.better-comments`) - Improved comment highlighting
- **Error Lens** (`usernamehw.errorlens`) - Inline error/warning display

## Install Extensions via Command Line

```bash
# Theme
code --install-extension Catppuccin.catppuccin-vsc

# Python
code --install-extension ms-python.python
code --install-extension ms-python.black-formatter
code --install-extension ms-python.isort

# Go
code --install-extension golang.go

# JavaScript/TypeScript
code --install-extension esbenp.prettier-vscode

# YAML
code --install-extension redhat.vscode-yaml

# Optional
code --install-extension eamodio.gitlens
code --install-extension aaron-bond.better-comments
code --install-extension usernamehw.errorlens
```

## Features

This configuration provides:

- **Catppuccin Mocha theme** (standard palette from VS Code extension)
- **Relative line numbers** (like Neovim with `relativenumber`)
- **Block cursor** (like Neovim)
- **Format on save** for Python, Go, JavaScript/TypeScript
- **Nerd Font support** for icons
- **Consistent tab settings** with Neovim (4 spaces, EditorConfig-aware)
- **Git integration** matching Neovim's fugitive workflow

## Customization

Edit `settings.json` to customize:
- Font family and size
- Color theme accent
- Language-specific formatters
- Keybindings (add `keybindings.json`)

## Color Scheme

The VS Code configuration uses the same Catppuccin Mocha theme as Neovim and Tmux, providing a consistent visual experience. Note that VS Code uses the standard Catppuccin Mocha palette from the extension, while Neovim has custom bright color overrides configured in its Lua files.
