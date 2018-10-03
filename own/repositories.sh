#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils-apt.sh" \
    && . "./utils.sh"

print_in_purple "\n   Agregando Repositorios\n\n"
install_package "Apt Transport https" "apt-transport-https"
install_package "Wget" "wget"
# llvm
add_key "https://apt.llvm.org/llvm-snapshot.gpg.key"
apt_add_repo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-6.0 main"
# yarn
add_key "https://dl.yarnpkg.com/debian/pubkey.gpg"
add_to_source_list "https://dl.yarnpkg.com/debian/ stable main" "yarn.list"
# vscode
add_key "https://packages.microsoft.com/keys/microsoft.asc"
add_to_source_list "[arch=amd64] https://packages.microsoft.com/repos/vscode stable main" "vscode.list"
update
add_ppa "communitheme/ppa"
add_ppa "papirus/papirus"
add_ppa "otto-kesselgulasch/gimp"
add_ppa "wireshark-dev/stable"
add_ppa "cpick/hub"
add_ppa "thomas-schiex/blender"
update
update