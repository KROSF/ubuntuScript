#!/bin/bash

function ubuntuAll {
    sudo apt-get -y update 
    sudo apt-get -y upgrade
    primary_packages
    repositories
    sudo apt-get -y update
    sudo apt-get -y upgrade
    packages
    gdebi_packages
    symlinks
    nodeModules
    maven
}

function primary_packages {
    PRIMARY=(
        curl
        wget
        git
        software-properties-common
        apt-transport-https
    )
    bold 'Instalando Paquetes Primarios...'
    sudo apt-get install -y ${PRIMARY[@]}
}

function repositories {
    bold 'Agregando Repositorios...'
    # VSCODE REPO
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    # CLANG
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add
    sudo apt-add-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-6.0 main"
    #Communitheme
    sudo add-apt-repository ppa:communitheme/ppa
    #Papirus
    sudo add-apt-repository ppa:papirus/papirus
    #Yarn
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    #Gimp
    sudo add-apt-repository ppa:otto-kesselgulasch/gimp
    #Wireshark
    sudo add-apt-repository ppa:wireshark-dev/stable
    #Hub
    sudo add-apt-repository ppa:cpick/hub
    #Blender
    sudo add-apt-repository ppa:thomas-schiex/blender
}

function packages {
    PACKAGES=(
        blender
        bluegriffon
        build-essential
        clang-6.0
        clang-format-6.0
        clang-tools-6.0
        code
        gdebi
        gimp
        gnome-tweak-tool
        hub
        libclang-common-6.0-dev
        libclang1-6.0
        libfuzzer-6.0-dev
        libllvm6.0
        lld-6.0
        lldb-6.0
        llvm-6.0
        llvm-6.0-dev
        llvm-6.0-runtime
        net-tools
        nodejs
        npm
        openjdk-8-jdk
        papirus-icon-theme
        python-clang-6.0
        ubuntu-communitheme-session
        virtualbox
        virtualbox-ext-pack
        wireshark
        yarn
        zsh
    )
    bold 'Instalando Paquetes ...'
    sudo apt-get install -y ${PACKAGES[@]}
}

function gdebi_packages {
    cd /tmp
    wget http://bluegriffon.org/freshmeat/3.0.1/bluegriffon-3.0.1.Ubuntu16.04-x86_64.deb
    wget https://github.com/zeit/hyper/releases/download/2.1.0-canary.2/hyper_2.1.0-canary.2_amd64.deb
    bold 'Instalando Paquetes .deb...'
    sudo gdebi bluegriffon-3.0.1.Ubuntu16.04-x86_64.deb
    sudo gdebi hyper_2.1.0-canary.2_amd64.deb
    cd $HOME
}

function symlinks {
    bold 'Symbolic Links...'
    sudo ln -s /usr/bin/clang-6.0 /usr/bin/clang
    sudo ln -s /usr/bin/clang++-6.0 /usr/bin/clang++
    sudo ln -s /usr/bin/clangd-6.0 /usr/bin/clangd
    sudo ln -s /usr/bin/llvm-config-6.0 /usr/bin/llvm-config
}

function nodeModules {
    echo "Instalado Global Node Modules"
    MODULES=(
        gatsby-cli
    )
    npm install --global ${MODULES[@]}
}

function maven {
    bold 'Instalado Maven...'
    cd /tmp && wget http://mirrors.koehn.com/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.zip
    unzip apache-maven-3.5.4-bin.zip
    sudo mv apache-maven-3.5.4 /opt/apache-maven-3.5.4
    cd $HOME
}

function oh-my-zsh {
    echo "Instalando Oh-My-Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "Instalando Dependencias Oh-My-Zsh"
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "Obteniendo Configuracion..."
    GIST=2a8d6af7b7505488b14ec023a930590b
    cd $HOME && git clone https://gist.github.com/${GIST}.git
    mv ${GIST}/.* ./
    sudo rm -r ${GIST}
    chsh -s $(which zsh)
}

function xampp_install {
    cd /tmp
    wget https://www.apachefriends.org/xampp-files/7.2.10/xampp-linux-x64-7.2.10-0-installer.run
    sudo chmod +x xampp-linux-x64-7.2.3-0-installer.run
    sudo ./xampp-linux-x64-7.2.3-0-installer.run
    cd $HOME
}