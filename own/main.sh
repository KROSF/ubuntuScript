#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils-apt.sh" \
    && . "./utils.sh"

update
upgrade
./repositories.sh
update
./packages.sh
./npm.sh
./symlinks.sh
./maven.sh
./cleanup.sh
./restart.sh