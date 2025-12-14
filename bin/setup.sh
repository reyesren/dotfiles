#!/bin/bash
# ---
# dotfiles boostrap
#
# DON'T FREAK! It backs everything up to:
#   ~/.dotfiles.backups
#
# ...unless you've tampered with things


HOME_DIR=$HOME
BACKUP_DIR="$HOME_DIR/.dotfiles.backups"
CURRENT_DIR=$(pwd -P)
DOTFILE_DIR="$CURRENT_DIR/dotfiles"
  

backup_dotfile() {
  if [[ -e "$HOME_DIR/$1" ]]; then
    
    dotfile_count=$(find $BACKUP_DIR/$1* -maxdepth 0 2> /dev/null | wc -l | sed 's/ //g')

    if [[ $dotfile_count -ne '0' ]]; then
      mv $HOME_DIR/$1 $BACKUP_DIR/$1.$dotfile_count
    else
      mv $HOME_DIR/$1 $BACKUP_DIR/$1
    fi
  fi
}


symlink_dotfile() {
  ln -s $DOTFILE_DIR/$1 $HOME_DIR/$1
}


if [[ $SUDO_USER ]]; then
  echo "Running scripts you find on the internet as root is dangerous. Try again without 'sudo'."
  exit 1
fi

if [[ ! -e $BACKUP_DIR ]]; then
  echo "Creating back ups folder $BACKUP_DIR..."
  mkdir $BACKUP_DIR
fi

dotfiles=$(ls -1 -A $DOTFILE_DIR 2> /dev/null)

if [[ $dotfiles ]]; then
  echo "Symlinking dotfiles..."

  for dotfile in $dotfiles; do
    echo "$dotfile"
    backup_dotfile $dotfile
    symlink_dotfile $dotfile
  done

  echo "All set! Any existing files were moved to $BACKUP_DIR"

else
  echo "You don't have anything in '$DOTFILE_DIR', bro-tato"
fi