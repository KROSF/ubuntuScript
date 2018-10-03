#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"
print_in_purple "\n   SymLinks\n\n"

execute \
        "sudo ln -s /usr/bin/clang-6.0 /usr/bin/clang" \
        "SYMLINK (clang-6.0)"
execute \
        "sudo ln -s /usr/bin/clang++-6.0 /usr/bin/clang++" \
        "SYMLINK (clang++-6.0)"
execute \
        "sudo ln -s /usr/bin/clangd-6.0 /usr/bin/clangd" \
        "SYMLINK (clangd-6.0)"