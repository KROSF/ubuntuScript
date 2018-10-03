#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n • Reiniciar\n\n"

    ask_for_confirmation "Deseas Reiniciar?"
    printf "\n"

    if answer_is_yes; then
        sudo shutdown -r now &> /dev/null
    fi

 }

 main
