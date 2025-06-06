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
  source $ZDOTDIR/.zprofile
  echo "🧑‍💻 Sourcing .zshrc"
  source $ZDOTDIR/.zshrc
}

function list_docker_ids_for_container() {
  docker ps --filter "label=com.docker.compose.project=$1" -q
}

function stop_project_containers() {
  list_docker_ids_for_container $1 | xargs docker stop
}