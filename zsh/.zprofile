if [[ "$(uname -s)" == "Darwin" ]]; then
  # On macOS, source keybindings.zsh
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


ZSH_CONFIG_DIR="$HOME/dotfiles/zsh"
source "$ZSH_CONFIG_DIR/path.zsh"
source "$ZSH_CONFIG_DIR/exports.zsh"