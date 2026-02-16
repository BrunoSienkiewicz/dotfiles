# ============================================================================
# Minimal ZSH Configuration
# ============================================================================

# History Configuration
HISTFILE="$ZDOTDIR/.zhistory"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY

# Completion System
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Key Bindings
bindkey -e  # Emacs-style keybindings
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# ============================================================================
# Minimal Prompt with Git Branch
# ============================================================================

# Enable git info in prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Configure git info format
zstyle ':vcs_info:git:*' formats ' [%b]'
zstyle ':vcs_info:*' enable git

# Prompt: folder_name [git_branch] $
PROMPT='%F{cyan}%1~%f%F{yellow}${vcs_info_msg_0_}%f %# '

# ============================================================================
# Plugins (Loaded after prompt)
# ============================================================================

# Syntax Highlighting - must be loaded after all widgets
if [ -f "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Auto Suggestions
if [ -f "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

# ============================================================================
# User Configuration
# ============================================================================

# Load aliases if they exist
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# Preferred editor
export EDITOR='nvim'
export VISUAL='nvim'
