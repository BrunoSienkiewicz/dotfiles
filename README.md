# Bruno's Dotfiles for SRE/DevOps/AI Research

This repository contains my personal dotfiles optimized for SRE (Site Reliability Engineering), DevOps, and AI Research workflows. The configuration is heavily focused on Kubernetes, Docker, Python, Go, and cloud infrastructure management.

## 🚀 Features

### Shell (ZSH with Oh-My-Zsh)
- **Enhanced Completions**: kubectl, docker, docker-compose, terraform, helm, aws, golang, python
- **Smart Navigation**: FZF integration for fuzzy finding, zoxide for smart directory jumping
- **Productivity Plugins**: 
  - Auto-suggestions and syntax highlighting
  - Command-not-found suggestions
  - Sudo plugin (press ESC twice to add sudo)
  - Git integration with advanced aliases

### Kubernetes Workflow
- **Comprehensive kubectl aliases** covering all common operations
- **Context/Namespace switching** with FZF integration (`kctx`, `kns`)
- **Quick pod access** with `kshell` function
- **Log streaming** shortcuts and functions
- **Resource management** helpers

### Docker & Containers
- Docker and docker-compose aliases for common operations
- Container selector with FZF (`dex` function)
- Quick cleanup commands
- Log tailing shortcuts

### Development Tools

#### Neovim
- **LSP Support**: Python (pyright), Go (gopls), Rust, Bash, Terraform, YAML, JSON, Docker, Helm
- **Debugging**: nvim-dap with Go and Python support
- **Kubernetes Integration**: YAML schema validation for K8s manifests
- **DevOps Tools**: Terraform and Helm syntax support
- **UI Enhancements**: 
  - which-key for keybinding discovery
  - trouble.nvim for better diagnostics
  - Telescope for fuzzy finding
  - Catppuccin theme
- **Git Integration**: fugitive, gitsigns
- **REST Client**: rest.nvim for API testing

#### Tmux
- Catppuccin theme
- Session persistence (resurrect & continuum)
- Vim-tmux navigator for seamless navigation
- Custom sessionizer script for quick project switching (Ctrl+f)
- Sensible defaults with mouse support

### Language-Specific Features

#### Python
- Conda environment management
- Virtual environment helpers
- Common aliases for pip, ipython
- Black, isort, ruff linting/formatting

#### Go
- gopls language server with full features
- Go debugging with nvim-dap-go
- Common go command aliases
- golangci-lint integration

#### Terraform
- terraform-ls language server
- Terraform syntax highlighting
- Common terraform aliases

## 📋 Key Aliases

### Kubernetes
```bash
k          # kubectl
kg         # kubectl get
kgp        # kubectl get pods
kgpa       # kubectl get pods --all-namespaces
kdesc      # kubectl describe
kl         # kubectl logs
klf        # kubectl logs -f
kex        # kubectl exec -it
ka         # kubectl apply -f
kdel       # kubectl delete
kctx       # Switch context (with fzf)
kns        # Switch namespace (with fzf)
kshell     # Quick pod shell access (with fzf)
```

### Docker
```bash
d          # docker
dps        # docker ps
dpsa       # docker ps -a
dex        # docker exec -it (with fzf selection)
dlog       # docker logs
dlogf      # docker logs -f
dc         # docker-compose
dcup       # docker-compose up -d
dcdown     # docker-compose down
dprune     # docker system prune -af
```

### Git
```bash
gs         # git status
ga         # git add
gc         # git commit
gp         # git push
gpl        # git pull
gd         # git diff
gl         # git log --oneline --graph
gco        # git checkout
gbr        # git branch switcher (with fzf)
glog       # git commit browser (with fzf)
```

### Terraform
```bash
tf         # terraform
tfi        # terraform init
tfp        # terraform plan
tfa        # terraform apply
tfd        # terraform destroy
tfv        # terraform validate
tff        # terraform fmt
```

### Helm
```bash
h          # helm
hi         # helm install
hu         # helm upgrade
hls        # helm list
```

### Python
```bash
py         # python3
ipy        # ipython
vact       # Activate venv or .venv
```

### Go
```bash
gor        # go run
gob        # go build
got        # go test
gomt       # go mod tidy
```

## 🔧 Neovim Key Bindings

### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action

### Debugging
- `<leader>db` - Toggle breakpoint
- `<leader>dc` - Continue
- `<leader>di` - Step into
- `<leader>do` - Step over
- `<leader>dt` - Toggle DAP UI
- `<leader>dgt` - Debug Go test

### Diagnostics (Trouble)
- `<leader>tt` - Toggle Trouble
- `<leader>tw` - Workspace diagnostics
- `<leader>td` - Document diagnostics
- `gR` - LSP references

### Telescope
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Buffers
- `<leader>fh` - Help tags

### REST Client
- `<leader>rr` - Run HTTP request
- `<leader>rp` - Preview request
- `<leader>rl` - Run last request

## 🛠️ Installation

```bash
cd ~
git clone https://github.com/BrunoSienkiewicz/dotfiles .dotfiles
cd .dotfiles
sudo ./setup.sh
```

## 📦 External Tools Recommendations

These tools are referenced in the configuration but need to be installed separately:

### Essential
- **fzf** - Fuzzy finder (highly recommended)
- **zoxide** - Smarter cd command
- **ripgrep (rg)** - Fast grep replacement
- **fd** - Fast find replacement
- **bat** - Cat with syntax highlighting
- **eza** - Modern ls replacement

### Kubernetes
- **k9s** - Kubernetes TUI
- **kubectx/kubens** - Context/namespace switcher
- **stern** - Multi-pod log tailing
- **helm** - Kubernetes package manager
- **kubectl** - Kubernetes CLI

### Docker
- **lazydocker** - Docker TUI
- **dive** - Docker image analyzer
- **ctop** - Container top

### Development
- **lazygit** - Git TUI
- **delta** - Better git diff
- **gh** - GitHub CLI
- **jq** - JSON processor
- **yq** - YAML processor

### Python
- **poetry** - Python dependency management
- **pyenv** - Python version management
- **black** - Python formatter
- **ruff** - Fast Python linter

### Go
- **golangci-lint** - Go linter
- **delve** - Go debugger

### Infrastructure
- **terraform** - Infrastructure as Code
- **ansible** - Configuration management
- **direnv** - Directory-specific environment variables

## 📝 Customization

### Adding Your Own Paths
Edit the tmux-sessionizer script to include your project directories:
```bash
# In .config/tmux/tmux-sessionizer.sh
selected=$(find ~/projects ~/work ~/your-path -mindepth 1 -maxdepth 1 -type d 2>/dev/null | fzf)
```

### Kubernetes Context Names
The configuration works with any kubectl context. Switch contexts with:
```bash
kctx  # Interactive context switcher with fzf
```

## 🎨 Theme

The entire setup uses the **Catppuccin Mocha** color scheme:
- Neovim: catppuccin/nvim
- Tmux: catppuccin/tmux
- FZF: Custom Catppuccin colors

## 🤝 Contributing

Feel free to suggest improvements or report issues!

## 📄 License

MIT License - feel free to use and modify as needed.
