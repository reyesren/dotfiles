PACKAGE_LIST="$DOTFILES/packages/package-list"
LINUX_INSTALL_LIST="$DOTFILES/packages/linux-install-list"

function add_package_to_list() {
  setup_package_lists
  for package in "$@"; do
    echo $package >> $PACKAGE_LIST
    echo "📦 Adding package $package to package lists"
    add_package_to_linux_list $package
  done
}

function setup_package_lists() {
  if [ ! -f $PACKAGE_LIST ]; then
    touch $PACKAGE_LIST
  fi
  if [ ! -f $LINUX_INSTALL_LIST ]; then
    touch $LINUX_INSTALL_LIST
  fi
}

function add_package_to_linux_list() {
  echo "sudo apt install $package" >> $LINUX_INSTALL_LIST
}

function source_dotfiles() {
  echo "🧑‍💻 Sourcing .zprofile"
  source $HOME/.zprofile
  echo "🧑‍💻 Sourcing .zshrc"
  source $HOME/.zshrc
}