# Testing in Isolated Environment

Test this configuration safely without affecting your system.

## Quick Test (Docker)

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

## Docker with Mounted Volume

For testing changes during development:

```dockerfile
# Dockerfile.test
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y sudo git curl wget && \
    useradd -m -s /bin/bash testuser && \
    echo "testuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER testuser
WORKDIR /home/testuser
```

Build and run:

```bash
docker build -f Dockerfile.test -t dotfiles-test .
docker run -it --rm -v $(pwd):/home/testuser/.dotfiles dotfiles-test

# Inside container:
cd .dotfiles
./setup.sh
zsh
```

## Test Components

**ZSH**: Check prompt shows `folder [branch] $`  
**Tmux**: Run `tmux`, try `Ctrl+a |` to split  
**Neovim**: Run `nvim`, try `<Space>ff` to find files  

## Alternative: VM Testing

Using Multipass (Ubuntu VMs):

```bash
multipass launch --name test --cpus 2 --mem 4G
multipass shell test

# Inside VM:
git clone https://github.com/BrunoSienkiewicz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
zsh

# Clean up:
exit
multipass delete test && multipass purge
```

## Alternative: Test User

Create a temporary user (Linux):

```bash
sudo useradd -m -s /bin/bash testuser
sudo su - testuser
git clone https://github.com/BrunoSienkiewicz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh

# Clean up (as your user):
exit
sudo userdel -r testuser
```

## Component Testing

Test individual parts without full installation:

**ZSH only**:
```bash
ZDOTDIR=/tmp/test-zsh zsh
```

**Neovim only**:
```bash
NVIM_APPNAME=nvim-test nvim
```

**Tmux only**:
```bash
tmux -f .config/tmux/tmux.conf new-session
```
