#!/bin/bash
dir="$(dirname "$0")"

. $dir/all.sh
. $dir/color.sh

function main {
    show_info '#----------------------------------#'
    show_info '#       Ubuntu install script      #'
    show_info '#----------------------------------#'
    echo ''
    echo -e '\033[1;33m1.\033[0m Instalar toda la configuracion.'
    echo -e '\033[1;33m2.\033[0m Instalar configuracion terminal.'
    echo -e '\033[1;33m3.\033[0m Instalar XAMPP.'
    echo -e '\033[1;33mS.\033[0m Salir.'
    echo ''
    echo -en '\033[1;34mInserta tu opcion : \033[0m'
    read REPLY
    case $REPLY in
        1) echo "" && ubuntuAll;; # Instalar todo
        2) echo "" && oh-my-zsh;; # Instalar config terminal.
        3) echo "" && xampp_install;; # Instalar config terminal.
        [Ss]* ) echo '' && quit;; # Quit
        * ) clear && show_error '\aOpcion no valida, intentalo otra vez.' && main;;
    esac
}

# Quit
function quit {
    show_error 'Estas Seguro de querer salir? (S)i, (N)o '
    read REPLY
    case $REPLY in
        [Ss]* ) exit 99;;
        [Nn]* ) clear && main;;
        * ) clear && show_error 'Opcion no valida, intentalo otra vez.' && quit;;
    esac
}

main