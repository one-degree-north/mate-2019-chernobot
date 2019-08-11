#!/bin/bash
# 
# Copyright (c) 2019 Gary Kim <gary@garykim.dev>
# Licensed under GPL-3.0-only License
#
# Easily run this script by running 
# `curl -sSL --output chernobotinstaller.sh https://raw.githubusercontent.com/sas-mate-robotics/chernobot/master/install.sh && grep '#!/bin/bash' chernobotinstaller.sh > /dev/null && bash ./chernobotinstaller.sh dl`

set -e

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Fix XCode command line tools install check
    # Do not check

    echo -e 'Detected Darwin (macOS) OS\n'
    
    
    # # Check if c++ compiler is installed
    # type c++ > /dev/null || echo -e 'There is no C++ compiler avaliable on your computer.\nIf you would like to install one, run this command\nxcode-select --install\nthen rerun this script\n' && exit 1

    # Check if Homebrew is installed
    hash brew > /dev/null || (echo -e 'Homebrew is not installed\nIf you would like to install it, run this command\n/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"\nthen rerun this script.\n' && exit 1)
    echo 'Homebrew detected'

    # # Check if git is avaliable
    # type git > /dev/null || echo -e 'Git is not installed\nIf you would like to install it, run this command\nbrew install git\nthen rerun this script.\n' && exit 1

    # Check if XCode developer tools are installed.
    xcode-select -p || (echo -e 'XCode Developer tools are not installed. Please run this command\nxcode-select --install\nthen rerun this script\n' && exit 1)

    echo -e 'XCode Developer Tools detected'

    if [[ "$1" == "dl" ]] || [[ "$1" == "download" ]]; then
        git clone --recursive https://github.com/sas-mate-robotics/chernobot.git chernobot
        cd chernobot
        brew install sdl2 ninja cmake opencv
        mkdir -p tmp
        cd tmp
        cmake -G Ninja ..
        ninja install
        cd ..
    elif [[ "$1" == "update" ]]; then
        git pull
        git submodule update --init --recursive
        mkdir -p tmp
        cd tmp
        cmake -G Ninja ..
        ninja install
        cd ..
    else
        mkdir -p tmp
        cd tmp
        cmake -G Ninja ..
        ninja install
        cd ..
    fi

    echo -e 'Chernobot has been installed. You should find a file named "chernobot" in the chernobot folder.'
    
    exit 0

elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo -e "Detected GNU/Linux OS\n"

    if [ "$(cat /etc/os-release | grep -icP '(ID_LIKE=ubuntu|ID=ubuntu)')" != 1 ]; then
        echo -e 'Unfortunatly, there is not support for your distro. Currently, only Ubuntu and Ubuntu deriviatives are supported\n'
        exit 1
    fi
    
    if [[ "$1" == "dl" ]] || [[ "$1" == "download" ]]; then
        git clone --recursive https://github.com/sas-mate-robotics/chernobot.git chernobot
        cd chernobot
        sudo apt update && sudo apt install -y cmake ninja-build libsdl2-dev libopencv* libavdevice-dev
        mkdir -p tmp
        cd tmp
        cmake -G Ninja ..
        ninja install
        cd ..
    elif [[ "$1" == "update" ]]; then
        git pull
        git submodule update --init --recursive
        mkdir -p tmp
        cd tmp
        cmake -G Ninja ..
        ninja install
        cd ..
    else
        mkdir -p tmp
        cd tmp
        cmake -G Ninja ..
        ninja install
        cd ..
    fi

    echo -e 'Chernobot has been installed. You should find a file named "chernobot" in the chernobot folder.'

    exit 0

else
    echo -e "OS not recognized\n"
    
    exit 1
fi
