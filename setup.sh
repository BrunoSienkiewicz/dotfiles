#!/usr/bin/env bash

# ============================================================================
# Dotfiles Setup Script
# Supports both Linux and macOS
# ============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Dotfiles Setup for ${MACHINE}        ${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo

# ============================================================================
# Helper Functions
# ============================================================================

print_step() {
    echo -e "${GREEN}==>${NC} ${BLUE}$1${NC}"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# ============================================================================
# Variables
# ============================================================================

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# ============================================================================
# Package Manager Setup
# ============================================================================

install_package_manager() {
    if [ "$MACHINE" = "Mac" ]; then
        if ! command_exists brew; then
            print_step "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            print_success "Homebrew installed"
        else
            print_success "Homebrew already installed"
        fi
    else
        print_step "Using system package manager (apt/dnf/pacman)"
    fi
}

# ============================================================================
# Install Dependencies
# ============================================================================

install_dependencies() {
    print_step "Installing dependencies..."

    if [ "$MACHINE" = "Mac" ]; then
        brew install git curl wget neovim tmux zsh ripgrep fd fzf eza bat
    elif [ "$MACHINE" = "Linux" ]; then
        if command_exists apt-get; then
            sudo apt-get update
            sudo apt-get install -y git curl wget build-essential tmux zsh ripgrep fd-find fzf
            
            # Install Neovim
            if ! command_exists nvim || [ "$(nvim --version | head -n1 | grep -oP '(?<=v)[0-9]+\.[0-9]+' | cut -d. -f1)" -lt 1 ]; then
                print_step "Installing Neovim (latest stable)..."
                wget -O /tmp/nvim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
                sudo tar -C /opt -xzf /tmp/nvim.tar.gz
                sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
                rm /tmp/nvim.tar.gz
            fi
            
            # Install eza (modern ls replacement)
            if ! command_exists eza; then
                print_step "Installing eza..."
                wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | sudo tar xz -C /usr/local/bin
            fi
            
            # Install bat (better cat)
            if ! command_exists bat; then
                wget -O /tmp/bat.deb https://github.com/sharkdp/bat/releases/latest/download/bat_*_amd64.deb
                sudo dpkg -i /tmp/bat.deb
                rm /tmp/bat.deb
            fi
            
        elif command_exists dnf; then
            sudo dnf install -y git curl wget gcc make tmux zsh ripgrep fd-find fzf neovim bat
        elif command_exists pacman; then
            sudo pacman -Sy --noconfirm git curl wget base-devel tmux zsh ripgrep fd fzf neovim eza bat
        fi
    fi
    
    print_success "Dependencies installed"
}

# ============================================================================
# Install Nerd Fonts
# ============================================================================

install_fonts() {
    print_step "Installing Nerd Fonts..."
    
    if [ "$MACHINE" = "Mac" ]; then
        brew tap homebrew/cask-fonts
        brew install --cask font-jetbrains-mono-nerd-font
    else
        FONT_DIR="$HOME/.local/share/fonts"
        mkdir -p "$FONT_DIR"
        
        if [ ! -f "$FONT_DIR/JetBrainsMonoNerdFont-Regular.ttf" ]; then
            wget -O /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
            unzip -o /tmp/JetBrainsMono.zip -d "$FONT_DIR"
            rm /tmp/JetBrainsMono.zip
            fc-cache -fv
        fi
    fi
    
    print_success "Nerd Fonts installed"
}

# ============================================================================
# Create Symlinks
# ============================================================================

create_symlinks() {
    print_step "Creating symlinks..."
    
    # Create config directory if it doesn't exist
    mkdir -p "$CONFIG_DIR"
    
    # Backup existing configs
    for item in zsh tmux nvim; do
        if [ -e "$CONFIG_DIR/$item" ] && [ ! -L "$CONFIG_DIR/$item" ]; then
            mkdir -p "$BACKUP_DIR"
            print_warning "Backing up existing $item config to $BACKUP_DIR"
            mv "$CONFIG_DIR/$item" "$BACKUP_DIR/"
        fi
    done
    
    # Backup root configs
    for item in .zshenv .aliases; do
        if [ -e "$HOME/$item" ] && [ ! -L "$HOME/$item" ]; then
            mkdir -p "$BACKUP_DIR"
            print_warning "Backing up existing $item to $BACKUP_DIR"
            mv "$HOME/$item" "$BACKUP_DIR/"
        fi
    done
    
    # Create symlinks
    ln -sf "$DOTFILES_DIR/.config/zsh" "$CONFIG_DIR/zsh"
    ln -sf "$DOTFILES_DIR/.config/tmux" "$CONFIG_DIR/tmux"
    ln -sf "$DOTFILES_DIR/.config/nvim" "$CONFIG_DIR/nvim"
    ln -sf "$DOTFILES_DIR/.zshenv" "$HOME/.zshenv"
    ln -sf "$DOTFILES_DIR/.aliases" "$HOME/.aliases"
    
    print_success "Symlinks created"
}

# ============================================================================
# Setup ZSH
# ============================================================================

setup_zsh() {
    print_step "Setting up ZSH..."
    
    # Create plugin directory
    mkdir -p "$CONFIG_DIR/zsh/plugins"
    
    # Install zsh-syntax-highlighting
    if [ ! -d "$CONFIG_DIR/zsh/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            "$CONFIG_DIR/zsh/plugins/zsh-syntax-highlighting"
    fi
    
    # Install zsh-autosuggestions
    if [ ! -d "$CONFIG_DIR/zsh/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions.git \
            "$CONFIG_DIR/zsh/plugins/zsh-autosuggestions"
    fi
    
    # Change default shell to zsh
    if [ "$SHELL" != "$(which zsh)" ]; then
        print_warning "Changing default shell to zsh (requires password)"
        chsh -s "$(which zsh)"
    fi
    
    print_success "ZSH setup complete"
}

# ============================================================================
# Setup Tmux
# ============================================================================

setup_tmux() {
    print_step "Setting up Tmux..."
    
    # Install TPM (Tmux Plugin Manager)
    if [ ! -d "$CONFIG_DIR/tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm "$CONFIG_DIR/tmux/plugins/tpm"
    fi
    
    print_success "Tmux setup complete"
    print_warning "Run 'tmux' and press 'Ctrl+a' then 'I' to install tmux plugins"
}

# ============================================================================
# Setup Neovim
# ============================================================================

setup_neovim() {
    print_step "Setting up Neovim..."
    
    # Lazy.nvim will auto-install on first run
    print_success "Neovim setup complete"
    print_warning "Run 'nvim' to install plugins automatically"
}

# ============================================================================
# Main Installation
# ============================================================================

main() {
    print_step "Starting installation..."
    echo
    
    install_package_manager
    install_dependencies
    install_fonts
    create_symlinks
    setup_zsh
    setup_tmux
    setup_neovim
    
    echo
    echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║   Installation Complete! 🎉            ${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
    echo
    echo -e "${YELLOW}Next steps:${NC}"
    echo "  1. Restart your terminal or run: source ~/.zshenv"
    echo "  2. Open tmux and press Ctrl+a then I to install plugins"
    echo "  3. Open nvim - plugins will install automatically"
    echo
    
    if [ -d "$BACKUP_DIR" ]; then
        echo -e "${YELLOW}Note:${NC} Your old configs were backed up to:"
        echo "  $BACKUP_DIR"
        echo
    fi
}

# Run main function
main
