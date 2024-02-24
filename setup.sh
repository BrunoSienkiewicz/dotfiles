#!/bin/bash

dotfiles_dir="/home/$SUDO_USER/.dotfiles" 
config_dir="/home/$SUDO_USER/.config"
target_user_home="/home/$SUDO_USER"

# prerequisites
apt get update
dpkg -l | grep -q "^ii  git" > /dev/null || apt-get update && apt-get install -y git
dpkg -l | grep -q "^ii  make" > /dev/null || apt-get update && apt-get install -y make
dpkg -l | grep -q "^ii  cmake" > /dev/null || apt-get update && apt-get install -y cmake
dpkg -l | grep -q "^ii  curl" > /dev/null || apt-get update && apt-get install -y curl
dpkg -l | grep -q "^ii  gettext" > /dev/null || apt-get update && apt-get install -y gettext
dpkg -l | grep -q "^ii  nodejs" > /dev/null || apt-get update && apt-get install -y nodejs
dpkg -l | grep -q "^ii  npm" > /dev/null || apt-get update && apt-get install -y npm

# rust
export CARGO_HOME=$target_user_home/.cargo
export RUSTUP_HOME=$target_user_home/.rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
export PATH=$PATH:$CARGO_HOME/bin
source "$CARGO_HOME/env"

# Function to create symlinks
create_symlinks() {
    local source="$1"
    local target="$2/$(basename "$source")"

    # Create symlink for the source file or directory
    ln -sf "$source" "$target"
    echo "Symlinked: $source to $target"
}

# Create symlinks for config files
for file in "$dotfiles_dir"/* "$dotfiles_dir"/.[!.]*; do
    if [ -f "$file" ]; then
        create_symlinks "$file" "$target_user_home"
    fi
done

for dir in "$dotfiles_dir/.config"/* "$dotfiles_dir/.config"/.[!.]*; do
    if [ -d "$dir" ]; then
        create_symlinks "$dir" "$target_user_home/.config"
    fi
done

# install neovim
if ! nvim --version > /dev/null; then
	git clone https://github.com/neovim/neovim /etc/neovim
	cd /etc/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo 
	git checkout stable
	make
	cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
fi

# setup packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim -c ":so $config_dir/nvim/lua/bruno/packer.lua"

# nerd font
mkdir -p $target_user_home/.local/share/fonts
wget -P $target_user_home/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/UbuntuMono.zip \
    && cd $target_user_home/.local/share/fonts \
    && unzip UbuntuMono.zip -d $target_user_home/.fonts\
    && rm UbuntuMono.zip \
    && fc-cache -fv

mkdir -p $target_user_home/.local/share/fonts
wget -P $target_user_home/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/RobotoMono.zip \
    && cd $target_user_home/.local/share/fonts \
    && unzip RobotoMono.zip -d $target_user_home/.fonts\
    && rm RobotoMono.zip \
    && fc-cache -fv

# install tmux
dpkg -l | grep -q "^ii  tmux" > /dev/null || apt-get update && apt-get install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# install zsh
dpkg -l | grep -q "^ii  zsh" > /dev/null || apt-get update && apt-get install -y zsh
export ZSH="$config_dir/zsh/oh-my-zsh" 
# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)

# plugins 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${config_dir}/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${config_dir}/zsh/oh-my-zsh/custom/plugins/zsh-autosuggestions
source $config_dir/zsh/.zshrc
