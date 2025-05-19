if [[ "$(uname -s)" == "Darwin" ]]; then
  # On macOS, source keybindings.zsh
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


ZSH_CONFIG_DIR="$ZDOTDIR"
source "$ZDOTDIR/path.zsh"
source "$ZDOTDIR/exports.zsh"