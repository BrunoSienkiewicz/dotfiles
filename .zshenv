# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ZSH Configuration Directory
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Default Editor
export EDITOR="nvim"
export VISUAL="nvim"

# Add local bin to PATH
export PATH="$HOME/.local/bin:$PATH"
