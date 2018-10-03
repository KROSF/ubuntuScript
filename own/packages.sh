#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils-apt.sh" \
    && . "./utils.sh"

print_in_purple "\n   Packages\n\n"

install_package "Blender" "blender"
install_package "Build Essential" "build-essential"
install_package "Communitheme" "ubuntu-communitheme-session"
install_package "Curl" "curl"
install_package "GIMP" "gimp"
install_package "Gdebi" "gdebi-core"
install_package "Git" "git"
install_package "Hub" "hub"
install_package "JDK-8" "openjdk-8-jdk"
install_package "LLVM Clang 6.0" "clang-6.0 clang-tools-6.0 libclang-common-6.0-dev libclang1-6.0 libllvm6.0 lldb-6.0 llvm-6.0 llvm-6.0-dev llvm-6.0-runtime clang-format-6.0 python-clang-6.0 lld-6.0 libfuzzer-6.0-dev"
install_package "Nodejs" "nodejs npm"
install_package "Pairus Icon" "papirus-icon-theme"
install_package "Software Properties Common" "software-properties-common"
install_package "Tweak Tool" "gnome-tweak-tool"
#install_package "VirtualBox" "virtualbox virtualbox-ext-pack"
install_package "Visual Studio Code" "code"
#install_package "Wireshark" "wireshark"
install_package "Yarn" "yarn"
install_package "ZSH" "zsh"