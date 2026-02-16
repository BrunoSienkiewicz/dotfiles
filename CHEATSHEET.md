# Quick Reference Cheatsheet

## 🔑 Essential Keybindings

### Tmux (Prefix: Ctrl+a)
```
Prefix + |          Split vertically
Prefix + -          Split horizontally
Prefix + c          New window
Prefix + n/p        Next/Previous window
Prefix + e          Rename window
Prefix + E          Rename session
Prefix + h/j/k/l    Resize pane
Alt + Arrow         Switch panes (no prefix!)
Prefix + [          Copy mode (use vi keys)
```

### Neovim (Leader: Space)

#### Find Everything (f)
```
<leader>ff          Find files
<leader>fg          Find by grep
<leader>fb          Find buffers
<leader>fr          Find references
<leader>fs          Find symbols
Ctrl+p              Git files
```

#### LSP (l)
```
<leader>ld          Line diagnostics
<leader>la          LSP actions
<leader>lr          LSP rename
<leader>lf          LSP format
gd                  Go to definition
K                   Hover docs
]d / [d             Next/Prev diagnostic
```

#### Git (g)
```
<leader>gs          Git status
<leader>gc          Git commit
<leader>gp          Git push
<leader>gl          Git pull
```

#### Splits (s)
```
<leader>sv          Split vertical
<leader>sh          Split horizontal
<leader>sc          Split close
Ctrl+h/j/k/l        Navigate splits
```

#### Other
```
<leader>e           Toggle file explorer
<leader>y/p         Yank/Paste to clipboard
<leader>sr          Search & replace
U                   Redo
```

## 📂 Useful Commands

### Git
```bash
gs                  # git status
gc -m "msg"         # git commit
gp                  # git push
gl                  # git pull
glog                # pretty git log
```

### Files
```bash
ll                  # detailed list (with eza if installed)
lt                  # tree view (with eza)
cat file            # view file (with bat if installed)
```

### Tmux Sessions
```bash
tmux                # Start new session
ta name             # Attach to session
ts name             # New session with name
tl                  # List sessions
tk name             # Kill session
```

## 🛠️ Maintenance Commands

### Neovim
```vim
:Lazy               " Plugin manager
:Mason              " LSP/formatter installer
:checkhealth        " Check setup
```

### Tmux
```
Prefix + I          Install plugins
Prefix + U          Update plugins
Prefix + r          Reload config
```

## 🚀 First Time Setup

1. Clone dotfiles:
```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Run setup:
```bash
./setup.sh
```

3. Restart terminal and open tmux:
```bash
tmux
# Press Ctrl+a then I to install plugins
```

4. Open Neovim:
```bash
nvim
# Wait for plugins to install, then restart
```

## 💡 Tips

- Use `Ctrl+r` in shell for fuzzy command history
- Use `Ctrl+p` in nvim for quick file access
- Create tmux session per project: `ts myproject`
- Use `<leader>ff` in nvim to find files by name
- Use `<leader>fg` to search text in files
- Telescope searches are fuzzy - just type parts of what you want

## 📚 Learn More

- Neovim: `:help` or `:Tutor`
- Tmux: `man tmux`
- LSP: `:help lsp`
- Telescope: `:help telescope`
