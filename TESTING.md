# Testing Dotfiles in Isolated Environment

This guide explains several ways to test this dotfiles configuration without affecting your current system setup.

## Method 1: Docker Container (Recommended)

The safest way to test is using Docker, which provides complete isolation.

### Create a Test Dockerfile

```dockerfile
# Dockerfile.test
FROM ubuntu:22.04

# Install sudo and create a test user
RUN apt-get update && apt-get install -y sudo git curl wget && \
    useradd -m -s /bin/bash testuser && \
    echo "testuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER testuser
WORKDIR /home/testuser

# Clone the dotfiles (replace with your fork URL)
RUN git clone https://github.com/BrunoSienkiewicz/dotfiles.git .dotfiles

# Set up the environment
WORKDIR /home/testuser/.dotfiles
RUN ./setup.sh

# Start zsh by default
CMD ["/usr/bin/zsh"]
```

### Build and Run

```bash
# Build the test image
docker build -f Dockerfile.test -t dotfiles-test .

# Run interactively
docker run -it --rm dotfiles-test

# Or run with your code mounted (for development)
docker run -it --rm -v $(pwd):/home/testuser/.dotfiles dotfiles-test
```

### Test Everything

```bash
# Inside the container, test each component:

# 1. Test ZSH prompt and plugins
zsh
# You should see: folder_name [git_branch] $
# Try command with syntax highlighting
# Try Up arrow for history search

# 2. Test Tmux
tmux
# Try Ctrl+a | to split vertically
# Try Ctrl+a - to split horizontally
# Press Ctrl+a then I to install plugins

# 3. Test Neovim
nvim test.txt
# Try <leader>ff (space + ff) to find files
# Try <leader>e to toggle file explorer
# Wait for plugins to install on first run
```

## Method 2: Virtual Machine

Use a VM with snapshot capability to easily revert changes.

### Using Multipass (Ubuntu VMs)

```bash
# Install multipass (macOS/Linux)
# macOS: brew install multipass
# Linux: snap install multipass

# Create a test VM
multipass launch --name dotfiles-test --cpus 2 --mem 4G --disk 20G

# Enter the VM
multipass shell dotfiles-test

# Inside the VM
git clone https://github.com/BrunoSienkiewicz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh

# Test everything, then delete when done
exit
multipass delete dotfiles-test
multipass purge
```

### Using Vagrant

```ruby
# Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    git clone https://github.com/BrunoSienkiewicz/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    ./setup.sh
  SHELL
end
```

```bash
# Start and test
vagrant up
vagrant ssh

# Destroy when done
vagrant destroy
```

## Method 3: Temporary User Account (Linux/macOS)

Create a separate user account for testing.

### Linux

```bash
# Create test user
sudo useradd -m -s /bin/bash testuser
sudo passwd testuser

# Switch to test user
sudo su - testuser

# Clone and setup
git clone https://github.com/BrunoSienkiewicz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh

# Test everything, then logout
exit

# Delete test user when done (as your main user)
sudo userdel -r testuser
```

### macOS

```bash
# Create test user (in System Preferences or via CLI)
sudo dscl . -create /Users/testuser
sudo dscl . -create /Users/testuser UserShell /bin/zsh
sudo dscl . -create /Users/testuser RealName "Test User"
sudo dscl . -create /Users/testuser UniqueID 503
sudo dscl . -create /Users/testuser PrimaryGroupID 20
sudo dscl . -create /Users/testuser NFSHomeDirectory /Users/testuser
sudo mkdir /Users/testuser
sudo chown testuser:staff /Users/testuser

# Login as test user and test
# Delete when done in System Preferences
```

## Method 4: Chroot Environment (Linux Advanced)

Create an isolated chroot environment.

```bash
# Create chroot directory
sudo debootstrap stable /tmp/dotfiles-chroot http://deb.debian.org/debian/

# Mount necessary filesystems
sudo mount --bind /proc /tmp/dotfiles-chroot/proc
sudo mount --bind /sys /tmp/dotfiles-chroot/sys
sudo mount --bind /dev /tmp/dotfiles-chroot/dev

# Enter chroot
sudo chroot /tmp/dotfiles-chroot /bin/bash

# Inside chroot, setup as normal user
useradd -m -s /bin/bash testuser
su - testuser
# Clone and test...

# Exit and cleanup
exit
exit
sudo umount /tmp/dotfiles-chroot/{proc,sys,dev}
sudo rm -rf /tmp/dotfiles-chroot
```

## Method 5: Test Individual Components

If you want to test specific parts without full isolation:

### Test ZSH Config Only

```bash
# Backup your current zsh config
cp ~/.zshrc ~/.zshrc.backup
cp ~/.zshenv ~/.zshenv.backup

# Create temporary config
export ZDOTDIR=/tmp/test-zsh
mkdir -p $ZDOTDIR
cp .config/zsh/.zshrc $ZDOTDIR/
cp .zshenv /tmp/test-zshenv

# Start zsh with test config
ZDOTDIR=/tmp/test-zsh zsh

# Restore when done
exit
rm -rf /tmp/test-zsh /tmp/test-zshenv
mv ~/.zshrc.backup ~/.zshrc
mv ~/.zshenv.backup ~/.zshenv
```

### Test Neovim Config Only

```bash
# Test with alternate config location
XDG_CONFIG_HOME=/tmp/test-nvim nvim

# Or use NVIM_APPNAME for Neovim 0.9+
NVIM_APPNAME=nvim-test nvim
# This creates ~/.config/nvim-test/ instead of ~/.config/nvim/
```

### Test Tmux Config Only

```bash
# Test with alternate config
tmux -f .config/tmux/tmux.conf new-session
```

## Method 6: GitHub Codespaces

Use GitHub Codespaces for cloud-based testing (if you have access).

```bash
# In Codespaces terminal
git clone https://github.com/BrunoSienkiewicz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh

# Test everything in the cloud environment
```

## Comparison of Methods

| Method | Isolation | Setup Time | Cleanup | Best For |
|--------|-----------|------------|---------|----------|
| Docker | Complete | 5-10 min | Instant | Full testing, CI/CD |
| VM (Multipass) | Complete | 10-15 min | Instant | Realistic environment |
| VM (Vagrant) | Complete | 15-20 min | Instant | Reproducible testing |
| Test User | High | 5 min | Manual | Quick full testing |
| Chroot | High | 10 min | Manual | Linux-specific testing |
| Component Testing | Low | 1 min | Manual | Specific features |
| Codespaces | Complete | 5 min | Instant | Cloud-based testing |

## Recommended Workflow

1. **For development**: Use Docker with mounted volume for quick iterations
2. **For full testing**: Use VM (Multipass) for realistic environment
3. **For quick checks**: Use component testing for specific features
4. **For CI/CD**: Docker in automated pipelines

## Automated Testing Script

Here's a script to automate Docker-based testing:

```bash
#!/bin/bash
# test-dotfiles.sh

set -e

echo "Building test container..."
docker build -f Dockerfile.test -t dotfiles-test .

echo "Running tests..."
docker run -it --rm dotfiles-test bash -c '
    echo "Testing ZSH..."
    zsh -c "echo \"ZSH works: \$SHELL\""
    
    echo "Testing Neovim..."
    nvim --headless +qall && echo "Neovim starts successfully"
    
    echo "Testing Tmux..."
    tmux -V
    
    echo "All tests passed!"
'

echo "Interactive test session (press Ctrl+D to exit):"
docker run -it --rm dotfiles-test
```

Make it executable and run:
```bash
chmod +x test-dotfiles.sh
./test-dotfiles.sh
```

## Tips

- Always test in a fresh environment first
- Take snapshots (VM) before major changes
- Use Docker volumes to preserve data between tests
- Document any issues you find during testing
- Test on both Linux and macOS if possible

---

**Quick Start**: For the fastest isolated test, use Docker:
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
