# Quick Reference

## Tmux (Prefix: Ctrl+a)

```
|, -            Split vertical/horizontal
c               New window
n, p            Next/Previous window
e, E            Rename window/session
Alt+Arrow       Switch panes (no prefix)
h/j/k/l         Resize panes
I               Install plugins
r               Reload config
```

## Neovim (Leader: Space)

### Find (f)
```
ff              Find files
fg              Find by grep
fb              Find buffers
fh              Find help
fr              Find references
fs              Find symbols
Ctrl+p          Git files
```

### LSP (l)
```
ld              Line diagnostics
la              LSP actions
lr              LSP rename
lf              LSP format
gd              Go to definition
gi              Go to implementation
K               Hover docs
]d, [d          Next/Prev diagnostic
```

### Git (g)
```
gs              Git status
gc              Git commit
gp              Git push
gl              Git pull
```

### Testing (t)
```
tt              Test: Run nearest
tf              Test: Run file
td              Test: Debug nearest
ts              Test: Toggle summary
to              Test: Show output
tl              Test: Run last
```

### Splits (s)
```
v              Split vertical
h              Split horizontal
sc              Split close
Ctrl+h/j/k/l    Navigate splits
```

### Completion
```
Ctrl+Space      Trigger completion
Ctrl+n          Next completion
Ctrl+p          Previous completion
Ctrl+f          Scroll docs forward
Ctrl+b          Scroll docs backward
Tab/S-Tab       Navigate snippets
Enter           Confirm selection
```

### Other
```
<leader>e       Toggle explorer
<leader>y/p     Yank/Paste clipboard
<leader>sr      Search & replace
U               Redo
```

## Shell Aliases

**Development**:
```
py              python3
pytest          Run pytest
got             go test ./...
gotv            go test -v ./...
gotest          go test with coverage
gobench         go benchmark
```

**Git**:
```
ll              List detailed (eza)
lt              Tree view (eza)
gs              git status
gc              git commit
gp              git push
glog            git log pretty
ta              tmux attach
ts              tmux new session
vi/vim          nvim
```

## Useful Commands

**Tmux sessions**:
```bash
tmux            # New session
ta name         # Attach to session
ts name         # New named session
tl              # List sessions
```

**Neovim**:
```vim
:Lazy           " Plugin manager
:Mason          " LSP installer
:checkhealth    " Check setup
```

## First-Time Setup

1. Clone: `git clone https://github.com/BrunoSienkiewicz/dotfiles.git ~/.dotfiles`
2. Install: `cd ~/.dotfiles && ./setup.sh`
3. Restart terminal
4. Tmux: Press `Ctrl+a` then `I`
5. Neovim: Open `nvim`, wait for plugins
