#!/bin/bash
set -euo pipefail

dry_run=false

if [[ ${1:-} == "--dry-run" ]]; then
  dry_run=true
fi

run() {
  if [[ $dry_run == true ]]; then
    printf '+ '
    printf '%q ' "$@"
    printf '\n'
  else
    "$@"
  fi
}

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Install it first: https://brew.sh/"
  exit 1
fi

formulae=(
  bash bat
  coreutils
  diff-so-fancy
  eza fd findutils fzf gh git
  jq lazygit
  neovim nettle node nvm
  opencode
  pyenv pyenv-virtualenv python@3.12
  python@3.13 python@3.14 ripgrep
  tldr
  tmux tmuxinator tmuxinator-completion trash tree
  wget yarn yq zoxide
)

casks=(
  nikitabobko/tap/aerospace background-music copilot-cli dotnet-sdk
  font-blex-mono-nerd-font font-caskaydia-cove-nerd-font font-fira-code
  font-fira-code-nerd-font font-fira-mono-nerd-font font-hack-nerd-font
  font-ibm-plex-mono font-inconsolata-lgc-nerd-font
  font-jetbrains-mono-nerd-font font-monaspice-nerd-font
  font-mononoki-nerd-font font-roboto-mono-nerd-font
  font-sauce-code-pro-nerd-font font-space-mono-nerd-font ghostty maccy
)

run brew update

for formula in "${formulae[@]}"; do
  run brew install "$formula"
done

for cask in "${casks[@]}"; do
  run brew install --cask "$cask"
done
