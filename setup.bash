#!/bin/bash

# Shamelessly stolen from
# @guyfleeman :)

HELP_STR="Usage: ./setup.bash [--i3] | --help"

for i in "$@"
do
    case $i in
        --i3)
		window_manager='i3'
		;;
	-h|--help)
		echo -e "\n$HELP_STR"
		exit 0
		;;
	*)
 		echo "Unrecognized Option: $i"
		echo -e "\n$HELP_STR"
		exit 1
		# unknown options
		;;
    esac
done

# Become root
if [ $UID -ne 0 ]; then
	echo "-- Becoming root"
	exec sudo $0 $@
fi

# This script is run as sudo, but we dont want config files
# to be owned by root. We can use this to fix ownership
SETUP_USER="$SUDO_USER"
if [ -z "$SETUP_USER" ]; then
	SETUP_USER="$(whoami)"
fi

#detect os
echo "Detecting operating system."
if grep -q "Ubuntu 20.04" /etc/lsb-release; then
	echo "Ubuntu 20.04 LTS detected!"
	operating_system='ubuntu-20.04'
elif grep -q "Ubuntu 22.04" /etc/lsb-release; then
	echo "Ubuntu 22.04 LTS detected!"
	operating_system='ubuntu-22.04'
else
	echo "Unsupported operating system detected."
	exit 1
fi

mkdir -p build

#############
#  Packages #
#############

PKGS_FILE="system_packages/$operating_system-packages.txt"
PACKAGES="$(sed 's/#.*//;/^$/d' ${PKGS_FILE})"
echo $PACKAGES
if [ "$operating_system" = "ubuntu-20.04" ] | [ "$operating_system" = "ubuntu-22.04" ]  ; then
	apt update
	apt install -y $PACKAGES
fi

#############
#  WM Setup #
#############

if [ "$window_manager" = "i3" ]; then
	pushd window_manager/i3
	./setup.bash
	popd
fi

###########
#  Snaps  #
###########

if echo "$operating_system" | grep -i "ubuntu"; then
	echo "Will install snaps..."
	SNAPS_FILE="system_packages/ubuntu-snaps.txt"
	SNAPS="$(sed 's/#.*//;/^$/d' ${SNAPS_FILE})"
	SNAP_ARR=($SNAPS)
	for snp in "${SNAP_ARR[@]}"; do
		snap install --classic $snp
	done
fi


#####################
#  Update Defaults  #
#####################
# Comment below if you want to use ESP-32 toolchain with compatible
# terminal
update-alternatives --config x-terminal-emulator
update-alternatives --config editor 

########################
# Copy dotfiles and bg #
########################

dotfiles=("i3" "nvim" "rofi" "kitty")

for df in "${dotfiles[@]}"; do
	cp -r ./$df /home/$SETUP_USER/.config
	echo $df
done

cp ./comfy-home.png /home/$SETUP_USER/Pictures

#####################
# Install vim-plug  #
#####################
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
