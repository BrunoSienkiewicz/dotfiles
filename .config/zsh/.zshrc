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
bindkey -e
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Version Control Information in Prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '*'
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' actionformats '%b|%a'
zstyle ':vcs_info:*' enable git

# Function to check for git changes
git_prompt_status() {
  if [[ -n ${vcs_info_msg_0_} ]]; then
    # Check if there are any changes (staged, unstaged, or untracked)
    if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null || [[ -n $(git ls-files --others --exclude-standard 2>/dev/null) ]]; then
      echo "%F{red}*%f"
    fi
  fi
}

git_prompt_branch() {
  if [[ -n ${vcs_info_msg_0_} ]]; then
    local star=$(git_prompt_status)
    echo "${star}%F{green}<%f%F{green}${vcs_info_msg_0_}%f%F{green}>%f"
  fi
}

# Catppuccin Mocha colors: 117=sky/blue, 152=teal
PROMPT='%F{yellow}%D{%H:%M:%S}%f $(git_prompt_branch) %F{cyan}[%f%F{cyan}%~%f%F{cyan}]%f$ '

# Plugins
if [ -f "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [ -f "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

# User Configuration
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
export EDITOR='nvim'
export VISUAL='nvim'
