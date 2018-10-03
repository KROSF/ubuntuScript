#!/bin/bash
#Amarillo
show_info() {
    echo -e "\033[1;33m$@\033[0m" 
}
#Verde
show_success() {
    echo -e "\033[1;32m$@\033[0m"
}
#Azul
show_question() {
    echo -e "\033[1;34m$@\033[0m"
}
#Rojo
show_error() {
    echo -e "\033[1;31m$@\033[m" 1>&2
}

bold() {
    echo -e "\033[1m$@\033[0m"
}