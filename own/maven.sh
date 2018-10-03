#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils-apt.sh" \
    && . "./utils.sh"

print_in_purple "\n   Maven\n\n"

execute \
        "cd /tmp && wget http://mirrors.koehn.com/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.zip" \
        "Descargando"
execute \
        "unzip apache-maven-3.5.4-bin.zip && sudo mv apache-maven-3.5.4 /opt/apache-maven-3.5.4 && cd ${HOME}" \
        "Instalando"