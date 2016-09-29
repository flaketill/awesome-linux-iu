#!/usr/bin/env sh
# -*- coding: UTF-8 -*- 
# Copyright (C) 2016 Armando Ibarra
#  v0.0.1 alpha - 2016
# 

#----------------------------------------------------------------------
# Github multiple accounts with ssh config and severals keys
#
# Author: Ing. Armando Ibarra - armandoibarra1@gmail.com
# Email: armandoibarra1@gmail.com
# Date: 10/05/2016 
# Purpose:
#    Performs creation of Multiple SSH Keys for severals accounts
#    like as github , bitbucket, aur ,etc
#    on linux OS, invokes some system commands like
#    sudo, pacman, apt-get install, etc
#
#----------------------------------------------------------------------
# NOTES:    
#----------------------------------------------------------------------
# Test on Arch Linux x64
#----------------------------------------------------------------------

###############################################################################

# Licensed under the GNU GPL v3 - http://www.gnu.org/licenses/gpl-3.0.txt
# - or any later version.

# WPS install languages
# A bash script installing/building all needed dependencies to 
# build wps languages for just some Linux distributions.

# @author: Ing. Armando Ibarra

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

###############################################################################

#variables

#autor and project data
AUTHOR='Ing. Armando Ibarra <armandoibarra1@gmail.com>'
COPYRIGHT='Copyright (c) 2016, armandoibarra1@gmail.com'
LICENSE='GNU GPL Version 3'

PROYECT_NAME="awesome-linux-iu"

WEB_SITE="https://github.com/flaketill/$PROYECT_NAME/"
VERSION_SCRIPT="0.0.1 alpha"

#colors bash script
GREEN="\033[1;32m"
RESET="\033[0m"
WHITE="\033[1;37m"
BLUE="\033[1;34m"
RED="\033[1;31m"
YELLOW="\033[1;33m"

THIS_SCRIPT_PATH=`readlink -f $0`
THIS_SCRIPT_DIR=`dirname ${THIS_SCRIPT_PATH}`
TMP_CONF=$HOME"/.awesome-linux-iu"

DEPENDENCIES_ARCH="none"
DEPENDENCIES="sudo curl axel wget ssh git xclip xdotool expect scrot xorg-xwininfo conky-lua xfce4-notifyd xorg-xprop xcompmgr transset-df x11-ssh-askpass"

DISTRO="none"
PACKAGE_MANAGER="none"

#Ask pass with sudo if exist 
#
set -e

if which sudo &>/dev/null; then
	sudo -v
fi

printf "Please wait ...."

## Backup installed packages

## Create main.txt remove local, base
pacman -Qqe | grep -vx \"$(pacman -Qqg base)\" | grep -vx \"$(pacman -Qqm)\" > main.txt
## Create local.txt of local (includes AUR) packages installed
pacman -Qqm > local.txt

## Restore packages

## Install offical packages
sudo pacman -S --needed $(cat main.txt)

## Install non-official (local) packages
yaourt --noconfirm -S $(cat local.txt | grep -vx \"$(pacman -Qqm)\")

## Same as above but able to edit pkgbuild if have issue with a package
yaourt -S $(cat local.txt | grep -vx \"$(pacman -Qqm)\")

exit 0