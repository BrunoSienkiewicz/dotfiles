# 🚀 Minimal Development Environment

A clean, fast, and modern dotfiles configuration for developers. Optimized for speed and simplicity with a consistent experience across Linux and macOS.

## 🎯 Philosophy

This configuration follows these principles:
- **Minimal**: Only essential tools and configs
- **Fast**: Quick startup times, especially for Neovim
- **Intuitive**: Keybindings use first-letter mnemonics (e.g., `<leader>ff` = Find Files)
- **Consistent**: Unified theme (Catppuccin) across all tools
- **Cross-platform**: Works on both Linux and macOS

## 🛠️ Components

### ZSH - Shell
A minimal zsh configuration without heavy frameworks like oh-my-zsh.

**Features:**
- Clean prompt showing `folder_name [git_branch] $`
- Command history with smart search
- Syntax highlighting for commands
- Auto-suggestions based on history

**Keybindings:**
- `Ctrl+R`: Search command history
- `Up/Down`: Search history with prefix
- `Tab`: Completion menu

### Tmux - Session Manager
Terminal multiplexer for managing projects with multiple windows.

**Workflow:**
- One session per project
- Multiple windows per task (coding, git, terminal, etc.)

**Keybindings:**
- `Ctrl+a`: Prefix (instead of default Ctrl+b)
- `Prefix + |`: Split vertically
- `Prefix + -`: Split horizontally
- `Prefix + c`: New window
- `Prefix + n`: Next window
- `Prefix + p`: Previous window
- `Alt+Arrow`: Switch panes (no prefix needed)
- `Prefix + h/j/k/l`: Resize panes
- `Prefix + e`: Rename window
- `Prefix + E`: Rename session

**Plugins:**
- TPM: Plugin manager
- catppuccin: Theme
- vim-tmux-navigator: Navigate between vim and tmux seamlessly
- tmux-resurrect: Save/restore sessions
- tmux-continuum: Auto-save sessions
- tmux-yank: Copy to system clipboard

### Neovim - Code Editor
Blazingly fast Neovim configuration centered around Telescope for navigation.

**Key Features:**
- Fast startup time (~50ms)
- LSP support for major languages
- Telescope-centric workflow
- Intuitive first-letter keybindings
- Git integration
- Auto-completion and snippets

## ⌨️ Neovim Keybindings

Leader key: `Space`

### File Navigation (f = find)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ff` | Find Files | Search files in project |
| `<leader>fg` | Find by Grep | Search text in files |
| `<leader>fb` | Find Buffers | Switch between open files |
| `<leader>fh` | Find Help | Search help docs |
| `<leader>fr` | Find References | Show LSP references |
| `<leader>fs` | Find Symbols | Document symbols |
| `<Ctrl-p>` | Git Files | Search git-tracked files |

### LSP Actions (l = lsp)
| Key | Action | Description |
|-----|--------|-------------|
| `K` | Hover | Show documentation |
| `gd` | Go Definition | Jump to definition |
| `gD` | Go Declaration | Jump to declaration |
| `gi` | Go Implementation | Jump to implementation |
| `<leader>ld` | Line Diagnostics | Show line errors |
| `<leader>la` | LSP Actions | Code actions |
| `<leader>lr` | LSP Rename | Rename symbol |
| `<leader>lf` | LSP Format | Format document |
| `]d` | Next Diagnostic | Next error/warning |
| `[d` | Prev Diagnostic | Previous error/warning |

### Git (g = git)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>gs` | Git Status | Open fugitive |
| `<leader>gc` | Git Commit | Commit changes |
| `<leader>gp` | Git Push | Push to remote |
| `<leader>gl` | Git Pull | Pull from remote |

### Window Management (s = split)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>sv` | Split Vertical | Split window vertically |
| `<leader>sh` | Split Horizontal | Split window horizontally |
| `<leader>sc` | Split Close | Close current split |
| `<Ctrl-h/j/k/l>` | Navigate | Move between windows |

### Buffer Management (b = buffer)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>bd` | Buffer Delete | Close current buffer |
| `<leader>bn` | Buffer Next | Next buffer |
| `<leader>bp` | Buffer Previous | Previous buffer |

### File Explorer (e = explorer)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>e` | Toggle Explorer | Open/close file tree |

### Search & Replace (s = search)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>sr` | Search Replace | Replace word under cursor |
| `<leader>nh` | No Highlight | Clear search highlight |

### Quickfix List (q = quickfix)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>qo` | Quickfix Open | Open quickfix list |
| `<leader>qc` | Quickfix Close | Close quickfix list |
| `<leader>qn` | Quickfix Next | Next item |
| `<leader>qp` | Quickfix Prev | Previous item |

### Toggles (t = toggle)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>tw` | Toggle Wrap | Toggle line wrap |
| `<leader>tr` | Toggle Relative | Toggle relative numbers |

### Quality of Life
| Key | Action |
|-----|--------|
| `<leader>y` | Yank to system clipboard |
| `<leader>p` | Paste from system clipboard |
| `<leader>d` | Delete without yanking |
| `U` | Redo |
| `<Ctrl-d>` | Scroll down (centered) |
| `<Ctrl-u>` | Scroll up (centered) |
| `n/N` | Next/prev search (centered) |

## 📦 Recommended Tools

These tools are automatically installed by the setup script:

### Essential
- **ripgrep (rg)**: Fast text search (used by Telescope) - Better than grep
- **fd**: Fast file finder (alternative to find) - Used by telescope
- **fzf**: Fuzzy finder for command line - Interactive filtering
- **eza**: Modern ls replacement with colors and icons - Better file listing
- **bat**: Cat with syntax highlighting - Better file viewing
- **git**: Version control

### Why These Tools?
- **Speed**: All tools are written in Rust/Go for maximum performance
- **User-Friendly**: Better defaults and colorful output
- **Compatible**: Work as drop-in replacements for traditional tools
- **Cross-Platform**: Work on both Linux and macOS

### Optional Tools (Manual Install)

Install these for an even better experience:

```bash
# lazygit - Terminal UI for git (easier than fugitive for some)
brew install lazygit  # macOS
# or download from https://github.com/jesseduffield/lazygit

# delta - Better git diff viewer
brew install git-delta  # macOS
cargo install git-delta  # via Rust

# zoxide - Smarter cd command (learns your patterns)
brew install zoxide  # macOS
cargo install zoxide  # via Rust

# htop - Better process viewer
brew install htop  # macOS
sudo apt install htop  # Linux
```

## 🚀 Installation

### Quick Start

```bash
# Clone the repository (or your fork if you've customized it)
git clone https://github.com/BrunoSienkiewicz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Run the setup script
./setup.sh
```

### What the Script Does
1. Detects your OS (Linux/macOS)
2. Installs package manager (Homebrew on macOS)
3. Installs dependencies (git, curl, neovim, tmux, zsh, etc.)
4. Installs Nerd Fonts for icon support
5. Creates symlinks to config files
6. Sets up ZSH with plugins
7. Configures Tmux with plugins
8. Prepares Neovim (plugins install on first run)

### Post-Installation

1. **Restart your terminal** or run:
   ```bash
   source ~/.zshenv
   zsh
   ```

2. **Setup Tmux plugins**:
   ```bash
   tmux
   # Press Ctrl+a then I (capital i) to install plugins
   ```

3. **Open Neovim**:
   ```bash
   nvim
   # Plugins will install automatically
   # Wait for completion, then restart Neovim
   ```

## 🎨 Customization

### Change Theme Colors
Edit `.config/nvim/after/plugin/catppuccin.lua` to modify the color scheme.

### Add More LSP Servers
Edit `.config/nvim/after/plugin/lsp.lua` and add to `ensure_installed`:
```lua
ensure_installed = {
    "rust_analyzer",
    "lua_ls",
    "pyright",
    -- Add your language server here
}
```

### Add More Aliases
Edit `.aliases` to add your custom aliases.

### Modify ZSH Prompt
Edit `.config/zsh/.zshrc` - look for the `PROMPT` variable.

## 🗂️ File Structure

```
.
├── .config/
│   ├── nvim/              # Neovim configuration
│   │   ├── init.lua       # Entry point
│   │   ├── lua/bruno/     # Core configs
│   │   │   ├── remap.lua  # Keymappings
│   │   │   ├── set.lua    # Settings
│   │   │   └── lazy.lua   # Plugin manager
│   │   └── after/plugin/  # Plugin configurations
│   ├── tmux/
│   │   └── tmux.conf      # Tmux configuration
│   └── zsh/
│       └── .zshrc         # ZSH configuration
├── .zshenv                # ZSH environment variables
├── .aliases               # Shell aliases
├── setup.sh               # Installation script
└── README.md              # This file
```

## 🐛 Troubleshooting

### Neovim plugins not installing
```bash
# Open Neovim and run:
:Lazy sync
```

### Tmux plugins not loading
```bash
# Inside tmux, run:
# Prefix + I (capital i)
```

### Icons not showing
Make sure you have a Nerd Font installed and set it in your terminal:
- Terminal → Preferences → Font → JetBrains Mono Nerd Font

### ZSH not default shell
```bash
chsh -s $(which zsh)
# Restart terminal
```

### LSP not working for a language
```bash
# Open Neovim and run:
:Mason
# Install the required language server
```

## 🧪 Testing Before Installation

**Want to try this config without affecting your system?** See [TESTING.md](TESTING.md) for detailed guides on:
- Docker container testing (recommended)
- Virtual machine testing
- Temporary user accounts
- Component-specific testing

Quick test with Docker:
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

## 💡 Productivity Tips

### Workflow Optimization

**Project-based tmux sessions:**
```bash
# Create a session for each project
ts myproject
# Inside tmux, create windows for different tasks
Prefix + c  # New window for coding
Prefix + c  # New window for git
Prefix + c  # New window for terminal/tests
```

**Telescope workflows:**
- Use `<leader>ff` when you know the filename
- Use `<leader>fg` when you know the content
- Use `<leader>fb` to switch between open files quickly
- Use `<Ctrl-p>` for git-tracked files only (faster)

**LSP power moves:**
- `gd` to jump to definition, `Ctrl-o` to jump back
- Use `<leader>la` for quick fixes and refactoring
- `<leader>lr` to rename symbols across the project
- `]d` / `[d` to navigate errors quickly

**Git integration:**
- Use `:Git` (or `<leader>gs`) for staging files interactively
- Stage hunks with visual selection in fugitive
- Use gitsigns for viewing changes without leaving the file

**File explorer tips:**
- Use `<leader>e` to toggle, `Esc` to close
- In mini.files: `g.` to toggle dotfiles, `gs`/`gv` to split

### Time Savers

1. **Use fuzzy search everywhere** - Don't type full names
2. **Learn 5 keybindings per week** - Muscle memory takes time
3. **Use sessions** - Save your workspace state with `:lua require("persistence").load()`
4. **Use marks** - `ma` to set mark, `'a` to jump back
5. **Use registers** - `"ay` to yank to register a, `"ap` to paste

## 🤝 Contributing

Feel free to fork and customize this configuration for your needs!

## 📝 License

MIT License - Feel free to use and modify as you wish.

## 🙏 Credits

This configuration is built on top of amazing open-source projects:
- [Neovim](https://neovim.io/)
- [Tmux](https://github.com/tmux/tmux)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Catppuccin](https://github.com/catppuccin/catppuccin)

---

**Enjoy your new development environment! 🎉**
