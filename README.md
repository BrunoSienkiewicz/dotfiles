# Minimal Development Environment

Clean, fast dotfiles for developers. Optimized for Python, Go, and modern software development. Works on Linux and macOS.

## Philosophy

- **Minimal**: Essential tools only
- **Fast**: Quick startup times
- **Intuitive**: First-letter keybindings (`<leader>ff` = Find Files)
- **Cross-platform**: Linux + macOS support
- **Developer-focused**: Built for SWE with debugging, testing, and code quality tools

## Components

**ZSH** - Minimal shell with `[git_branch] [folder_name] $` prompt  
**Tmux** - Session manager (Prefix: `Ctrl+a`)  
**Neovim** - Fast editor with LSP, debugging, and testing support

## Features

### Language Support
- **Python**: pyright LSP, black/isort formatting, ruff linting, pytest integration
- **Go**: gopls LSP, gofumpt formatting, golangci-lint, test integration  
- **JavaScript/TypeScript**: ts_ls LSP, prettier formatting
- **Rust, C/C++, Lua, Bash**: Full LSP support

### Development Tools
- **Debugging**: DAP support for Python and Go with UI
- **Testing**: Integrated test runner with neotest (pytest, go test)
- **Code Quality**: Linters, formatters, type checkers
- **YAML/K8s**: Basic support for manifests when needed

## Quick Start

```bash
git clone https://github.com/BrunoSienkiewicz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```

## Test Before Installing

Try in Docker without affecting your system:

```bash
docker run -it --rm ubuntu:22.04 bash -c "
    apt-get update && apt-get install -y git sudo && \
    useradd -m -s /bin/bash test && \
    sudo -u test git clone https://github.com/BrunoSienkiewicz/dotfiles.git /home/test/.dotfiles && \
    cd /home/test/.dotfiles && \
    sudo -u test ./setup.sh && \
    sudo -u test zsh
"
```

See [TESTING.md](TESTING.md) for more testing options.

## Key Tools Installed

- **ripgrep** - Fast text search
- **fd** - Fast file finder
- **fzf** - Fuzzy finder
- **eza** - Modern ls with icons
- **bat** - Better cat
- **Neovim** - Latest stable
- **Nerd Fonts** - Icon support

## Neovim Keybindings

Leader: `Space`

**Find** (f): `ff` files, `fg` grep, `fb` buffers, `fr` references  
**LSP** (l): `ld` diagnostics, `la` actions, `lr` rename, `lf` format  
**Test** (t): `tt` run test, `tf` test file, `td` debug test, `ts` summary  
**Debug** (d): `db` breakpoint, `dc` continue, `dso` step over, `dt` toggle UI  
**Git** (g): `gs` status, `gc` commit, `gp` push  
**Split** (s): `sv` vertical, `sh` horizontal, `sc` close  
**Other**: `<leader>e` explorer, `gd` definition, `K` hover

See [CHEATSHEET.md](CHEATSHEET.md) for complete keybindings.

## Tmux Keybindings

Prefix: `Ctrl+a`

- `|` / `-` - Split vertical/horizontal
- `c` - New window
- `e` / `E` - Rename window/session
- `Alt+Arrow` - Switch panes (no prefix)
- `h/j/k/l` - Resize panes

## Post-Installation

1. Restart terminal or run: `source ~/.zshenv && zsh`
2. Open tmux and press `Ctrl+a` then `I` to install plugins
3. Open nvim - plugins install automatically

## Customization

**Add LSP servers**: Edit `.config/nvim/after/plugin/lsp.lua`  
**Change theme**: Edit `.config/nvim/after/plugin/catppuccin.lua`  
**Add aliases**: Edit `.aliases`  
**Modify prompt**: Edit `.config/zsh/.zshrc`

## Troubleshooting

**Neovim plugins**: `:Lazy sync`  
**Tmux plugins**: Prefix + `I`  
**Icons missing**: Install a Nerd Font in terminal settings  
**ZSH not default**: `chsh -s $(which zsh)`  
**LSP issues**: `:Mason` to install servers

## File Structure

```
.config/
  ├── nvim/      # Neovim config
  ├── tmux/      # Tmux config
  └── zsh/       # ZSH config
.aliases         # Shell aliases
.zshenv          # Environment vars
setup.sh         # Installation script
```

## Credits

Built with [Neovim](https://neovim.io/), [Tmux](https://github.com/tmux/tmux), [Lazy.nvim](https://github.com/folke/lazy.nvim), [Telescope](https://github.com/nvim-telescope/telescope.nvim), and [Catppuccin](https://github.com/catppuccin/catppuccin).

## License

MIT
