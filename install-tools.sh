#!/bin/bash
# Script to install recommended external tools for enhanced SRE/DevOps workflow

set -e

echo "🚀 Installing recommended tools for SRE/DevOps workflow..."

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Update package list
echo "📦 Updating package list..."
sudo apt-get update

# Install FZF (fuzzy finder)
if ! command_exists fzf; then
    echo "Installing fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
else
    echo "✓ fzf already installed"
fi

# Install zoxide (smart cd)
if ! command_exists zoxide; then
    echo "Installing zoxide..."
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
else
    echo "✓ zoxide already installed"
fi

# Install ripgrep
if ! command_exists rg; then
    echo "Installing ripgrep..."
    sudo apt-get install -y ripgrep
else
    echo "✓ ripgrep already installed"
fi

# Install fd-find
if ! command_exists fd; then
    echo "Installing fd-find..."
    sudo apt-get install -y fd-find
    # Create symlink if needed
    if [ ! -f ~/.local/bin/fd ]; then
        mkdir -p ~/.local/bin
        ln -s $(which fdfind) ~/.local/bin/fd
    fi
else
    echo "✓ fd already installed"
fi

# Install bat
if ! command_exists bat; then
    echo "Installing bat..."
    sudo apt-get install -y bat
    # Create symlink if needed (on Ubuntu it's batcat)
    if [ ! -f ~/.local/bin/bat ] && command_exists batcat; then
        mkdir -p ~/.local/bin
        ln -s $(which batcat) ~/.local/bin/bat
    fi
else
    echo "✓ bat already installed"
fi

# Install eza (modern ls)
if ! command_exists eza; then
    echo "Installing eza..."
    sudo apt-get install -y gpg
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt-get update
    sudo apt-get install -y eza
else
    echo "✓ eza already installed"
fi

# Install jq
if ! command_exists jq; then
    echo "Installing jq..."
    sudo apt-get install -y jq
else
    echo "✓ jq already installed"
fi

# Install yq
if ! command_exists yq; then
    echo "Installing yq..."
    sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq
    sudo chmod +x /usr/local/bin/yq
else
    echo "✓ yq already installed"
fi

# Install k9s (Kubernetes TUI)
if ! command_exists k9s; then
    echo "Installing k9s..."
    curl -sS https://webinstall.dev/k9s | bash
else
    echo "✓ k9s already installed"
fi

# Install lazygit
if ! command_exists lazygit; then
    echo "Installing lazygit..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm lazygit.tar.gz lazygit
else
    echo "✓ lazygit already installed"
fi

# Install lazydocker
if ! command_exists lazydocker; then
    echo "Installing lazydocker..."
    curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
else
    echo "✓ lazydocker already installed"
fi

# Install delta (better git diff)
if ! command_exists delta; then
    echo "Installing git-delta..."
    wget https://github.com/dandavison/delta/releases/download/0.17.0/git-delta_0.17.0_amd64.deb
    sudo dpkg -i git-delta_0.17.0_amd64.deb
    rm git-delta_0.17.0_amd64.deb
else
    echo "✓ delta already installed"
fi

# Install GitHub CLI
if ! command_exists gh; then
    echo "Installing GitHub CLI..."
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y gh
else
    echo "✓ gh already installed"
fi

# Install htop
if ! command_exists htop; then
    echo "Installing htop..."
    sudo apt-get install -y htop
else
    echo "✓ htop already installed"
fi

# Install ncdu
if ! command_exists ncdu; then
    echo "Installing ncdu..."
    sudo apt-get install -y ncdu
else
    echo "✓ ncdu already installed"
fi

# Install tldr
if ! command_exists tldr; then
    echo "Installing tldr..."
    sudo apt-get install -y tldr
else
    echo "✓ tldr already installed"
fi

# Install Python tools via pipx if pip is available
if command_exists pip3; then
    # Install pipx
    if ! command_exists pipx; then
        echo "Installing pipx..."
        python3 -m pip install --user pipx
        python3 -m pipx ensurepath
    fi
    
    # Install Python tools
    if command_exists pipx; then
        echo "Installing Python tools via pipx..."
        pipx install black || echo "black already installed"
        pipx install ruff || echo "ruff already installed"
        pipx install ipython || echo "ipython already installed"
    fi
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "📝 Notes:"
echo "  - Some tools may require a shell restart to be available"
echo "  - Run 'source ~/.zshrc' or restart your terminal"
echo "  - For Kubernetes tools (kubectl, helm, etc.), install them separately based on your needs"
echo "  - For cloud CLIs (aws, gcloud, az), install them from their official sources"
echo ""
echo "🔧 Optional manual installations:"
echo "  - kubectl: https://kubernetes.io/docs/tasks/tools/"
echo "  - helm: https://helm.sh/docs/intro/install/"
echo "  - terraform: https://www.terraform.io/downloads"
echo "  - docker: https://docs.docker.com/engine/install/"
echo "  - poetry: curl -sSL https://install.python-poetry.org | python3 -"
echo "  - pyenv: curl https://pyenv.run | bash"
echo ""
