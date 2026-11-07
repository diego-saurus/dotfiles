ZSH_THEME="rxyhn"
plugins=(git zoxide fzf fast-syntax-highlighting zsh-autosuggestions docker zsh-interactive-cd)

# Alias
alias vim='nvim'
alias lz="lazygit"
alias lzd="lazydocker"
alias oc="opencode"
alias py="python3"
alias cl="claude"

# Variables
export EDITOR=nvim

# Keybind
bindkey '^G' edit-command-line
