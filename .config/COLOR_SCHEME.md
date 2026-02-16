# Color Scheme Configuration Summary

This document summarizes the color scheme configuration across all tools in this dotfiles repository.

## Color Scheme: Catppuccin Mocha with Bright Custom Colors

All tools use the **Catppuccin Mocha** theme for consistency, with custom bright color overrides applied in Neovim.

### Configuration Details

#### 1. Neovim (`~/.config/nvim/after/plugin/catppuccin.lua`)
- **Base Theme**: Catppuccin Mocha
- **Flavor**: mocha
- **Customization**: Bright, vibrant color overrides for enhanced visibility
- **Transparency**: Enabled (`transparent_background = true`)
- **Custom Colors**: 
  - Rosewater: `#ffc9e0`
  - Flamingo: `#ffb3d9`
  - Pink: `#ff9ddb`
  - Mauve: `#d0a9ff`
  - Red: `#ff6b8a`
  - Maroon: `#ff8fab`
  - Peach: `#ffb380`
  - Yellow: `#ffe680`
  - Green: `#a6e3a1`
  - Teal: `#8ff0e0`
  - Sky: `#91d7ff`
  - Sapphire: `#82cfff`
  - Blue: `#96c9ff`
  - Lavender: `#c9beff`

#### 2. Tmux (`~/.config/tmux/tmux.conf`)
- **Plugin**: `catppuccin/tmux`
- **Flavor**: mocha
- **Configuration**: Standard Catppuccin Mocha styling with custom status bar layout

#### 3. VS Code (`~/.config/vscode/settings.json`)
- **Extension**: Catppuccin for VSCode (`Catppuccin.catppuccin-vsc`)
- **Theme**: Catppuccin Mocha
- **Accent Color**: mauve
- **Additional Settings**: 
  - Relative line numbers (matching Neovim)
  - Block cursor (matching Neovim)
  - Nerd Font support
  - Format on save for Python, Go, JS/TS

## Consistency Features

All configurations share:
1. **Same base theme**: Catppuccin Mocha
2. **Same flavor**: mocha (dark theme)
3. **Similar visual appearance**: Consistent colors across terminal, editor, and multiplexer
4. **Same font family**: Nerd Fonts for icon support
5. **Same development workflow**: LSP, formatting, testing tools

## Why This Color Scheme?

The bright custom colors provide:
- **Enhanced visibility**: Easier to distinguish syntax elements
- **Reduced eye strain**: Vibrant yet comfortable colors
- **Better contrast**: Important elements stand out more
- **Consistency**: Same theme across all development tools

## Previous Configuration

The repository previously used the standard Catppuccin Mocha palette without custom color overrides. The bright colors were added to improve visibility and make syntax highlighting more vibrant.

## Switching Back to Standard Palette

If you prefer the standard Catppuccin Mocha colors without the bright overrides, edit `.config/nvim/after/plugin/catppuccin.lua` and change:

```lua
color_overrides = {
    mocha = {
        -- Bright, vibrant color palette
        rosewater = "#ffc9e0",
        ...
    },
},
```

to:

```lua
color_overrides = {},
```

This will use the default Catppuccin Mocha color palette.
