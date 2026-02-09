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

function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
      VI_MODE="N"
      RPROMPT="%F{green}[NORMAL]%f"
      ;;
    $ZVM_MODE_INSERT)
      VI_MODE="I"
      RPROMPT="%F{yellow}[INSERT]%f"
      ;;
    $ZVM_MODE_VISUAL)
      VI_MODE="V"
      RPROMPT="%F{magenta}[VISUAL]%f"
      ;;
    $ZVM_MODE_VISUAL_LINE)
      VI_MODE="VL"
      RPROMPT="%F{magenta}[VISUAL_LINE]%f"
      ;;
    $ZVM_MODE_REPLACE)
      VI_MODE="R"
      RPROMPT="%F{red}[REPLACE]%f"
      ;;
  esac
}

