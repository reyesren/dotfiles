ZSH_CONFIG_DIR="$HOME/dotfiles/zsh"
source "$ZSH_CONFIG_DIR/path.zsh"
source "$ZSH_CONFIG_DIR/exports.zsh"

if [[ "$(uname -s)" == "Darwin" ]]; then
# Check if Homebrew is installed
  if which brew > /dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo "Homebrew not found."
  fi
else
  echo "Running on WSL!"
fi
