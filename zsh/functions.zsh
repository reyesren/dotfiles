PACKAGE_LIST="$DOTFILES/packages/package-list"
LINUX_PACKAGE_LIST="$DOTFILES/packages/linux-package-list"

function add_package_to_list() {
  touch $PACKAGE_LIST
  
  local package=$1
  echo $package >> $PACKAGE_LIST
}
