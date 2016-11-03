# !/bin/bash
# Missing package installer for (X)ubuntu 16.04 and 14.04.
# A simple script for installing some of the missing software (i like to use) on new systems
# 2016.10.23 by TRi

VER="0.5"
DIST_V="$(lsb_release -r -s)"
DIST_N="$(lsb_release -i -s)"

PKG_SYS="mc htop iftop conky imwheel curl keepassx gufw gparted p7zip-full bleachbit compton wmctrl kdocker terminator scrot redshift gtk-redshift synaptic aptitude cups csh lib32stdc++6"
PKG_DEV="build-essential gdb git tig python-pip monodevelop mono-runtime geany geany-common netbeans"
PKG_MEDIA="vlc soundconverter easytag sound-juicer libdvdread4 brasero ubuntu-restricted-extras"
PKG_OFFICE="pdfshuffler pdfchain libreoffice-impress"
PKG_LATEX="texstudio lyx lyx-common texlive texlive-lang-german"
PKG_INET="mumble corebird filezilla polari"
PKG_INET_14="mumble filezilla xchat-gnome"
PKG_GFX="imagemagick inkscape gimp xsane"
PKG_GAMES="wesnoth hedgewars gweled scummvm burgerspace"
PKG_ATOM_EXT="terminal-plus python-debugger language-haskell git-time-machine git-plus autocomplete-python activate-power-mode pdf-view minimap project-manager language-vue bottom-dock gulp-manager todo-manager symbols-tree-view pigments language-ini"

NAME_SYSTEM="System"
NAME_DEV="Development"
NAME_MEDIA="Media"
NAME_OFFICE="Office"
NAME_LATEX="LaTeX"
NAME_INET="Internet"
NAME_GFX="Graphics"
NAME_GAMES="Games"
NAME_PPA_PAPIRUS="PPA-Papirus"
NAME_PPA_KODI="PPA-Kodi"
NAME_PPA_VLC="PPA-VLC"
NAME_PPA_JAVA="PPA-Java"
NAME_PPA_LIBREOFFICE="PPA-Libre"
NAME_PPA_GIT="PPA-Git"
NAME_PPA_ATOM="PPA-Atom"
NAME_PPA_HIPCHAT="PPA-HipChat"
NAME_EXT_RUST="Rust-Lang"
NAME_EXT_NODE="Node.js"
NAME_EXT_DOCKER="Docker"
NAME_SCRIPT_UPDATE="Update-Script"
NAME_SCRIPT_KERNEL="Kernel-Script"

##
# Updates the already installed packages.
##
function update_packages()
{
	echo -e "\nGoing to update the system packages first"
	sudo apt update && sudo apt upgrade -y
}

##
# Installes giving packages.
##
function install_packages()
{
	echo -e "\nInstalling: $*"
	sudo apt update && sudo apt install -y $*
}

##
# Installation of the system update script to /usr/bin/mkupdate.
##
function install_update_script()
{
	echo -e "\nInstalling update script"
	file_tmp="/tmp/mkupdate"
	file_dst="/usr/bin/mkupdate"
	apt_get="sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean"
	apt="sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove"

	if [ -f "$file_tmp" ]
	then
		rm $file_tmp
	fi
	touch $file_tmp
	echo -e "#!/bin/sh" >> $file_tmp
	if [ $DIST_N == "Ubuntu" ]
	then

		if [ $DIST_V == "16.04" ]
		then
			echo -e $apt >> $file_tmp

		elif [ $DIST_V == "14.04" ]
		then
			echo -e $apt_get >> $file_tmp
		fi

	elif [ $DIST_N == "LinuxMint" ]
	then

		if [ $DIST_V == "18" ]
		then
			echo -e $apt >> $file_tmp
		else
			echo -e $apt_get >> $file_tmp
		fi

	fi

	if [ -f "$file_dst" ]
	then
		sudo rm $file_dst
	fi
	sudo cp $file_tmp $file_dst
	sudo chmod a+x $file_dst
	echo "Installation of update script complete. Run 'mkupdate'"
}

##
# Installation to the remove old kernel script to /usr/bin/remove-old-kernels.
##
function install_kernel_script()
{
	echo -e "\nInstalling kernel script"
	file_tmp="/tmp/remove-old-kernels"
	file_dst="/usr/bin/remove-old-kernels"
	if [ -f "$file_tmp" ]
	then
		rm $file_tmp
	fi
	touch $file_tmp
	echo -e "#!/bin/sh" >> $file_tmp
	echo -e "sudo apt-get remove --purge \$(dpkg -l 'linux-*' | sed '/^ii/!d;/'\"\$(uname -r | sed \"s/\(.*\)-\([^0-9]\+\)/\\1/\")\"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\\1/;/[0-9]/!d')" >> $file_tmp

	if [ -f "$file_dst" ]
	then
		sudo rm $file_dst
	fi
	sudo cp $file_tmp $file_dst
	sudo chmod a+x $file_dst
	echo "Installation of script to remove old kernels complete. Run 'remove-old-kernels'"
}

##
# PPA: Install Papirus Icon Theme.
##
function install_PPA_papirus()
{
	echo -e "\nInstalling Papirus Icon Theme PPA"
	sudo add-apt-repository ppa:varlesh-l/papirus-pack -y
	sudo apt update
	sudo apt install -y papirus-gtk-icon-theme
	echo "Papirus Icon Theme PPA installed"
}

##
# PPA: Install Kodi.
##
function install_PPA_Kodi()
{
	echo -e "\nInstalling Kodi PPA"
	sudo add-apt-repository ppa:team-xbmc/ppa -y
	sudo apt update
	sudo apt install -y kodi
	echo "Kodi installed"
}

##
# PPA: Install VLC.
#
function install_PPA_VLC()
{
	echo -e "\nInstalling VLC PPA"
	sudo add-apt-repository ppa:videolan/stable-daily -y
	sudo apt update
	sudo apt install -y vlc
	echo "VLC Player installed"
}

##
# PPA: Oracle Java.
##
function install_PPA_Java()
{
	echo -e "\nInstalling JAVA PPA"
	sudo add-apt-repository ppa:webupd8team/java -y
	sudo apt update
	sudo apt install -y oracle-java8-installer
	echo "Oracle Java 8 installed"
}

##
# PPA: LibreOffice.
##
function install_PPA_LibreOffice()
{
	echo -e "\nInstalling LibreOffice PPA"
	sudo add-apt-repository ppa:libreoffice/ppa -y
	sudo apt update
	sudo apt install -y libreoffice-writer libreoffice-calc libreoffice-draw libreoffice-math
	echo "LibreOffice installed"
}

##
# PPA: Install Git.
##
function install_PPA_Git()
{
	echo -e "\nInstalling Git PPA"
	sudo add-apt-repository ppa:/git-core/ppa -y
	sudo apt update
	sudo apt install -y git
	echo "Git installed"
}

##
# PPA: Install Atom.
##
function install_PPA_Atom()
{
	echo -e "\nInstalling Atom PPA"
	sudo add-apt-repository ppa:webupd8team/atom -y
	sudo apt update
	sudo apt install -y atom
	echo -e "\nInstalling Atom extentions"
	apm install $PKG_ATOM_EXT
	echo "Atom installed"
}

##
# PPA: Atlassian HipChat 4
##
function install_PPA_HIPCHAT()
{
	echo -e "\nInstalling Atlassian HipChat PPA"
	sudo sh -c 'echo "deb https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client $(lsb_release -c -s) main" > /etc/apt/sources.list.d/atlassian-hipchat4.list'
	wget -O - https://atlassian.artifactoryonline.com/atlassian/api/gpg/key/public | sudo apt-key add -
	sudo apt update
	sudo apt install -y hipchat4
	echo "Atlassian HipChat installed"
}

##
# External: Rust lang installation.
##
function install_ext_rust()
{
	echo -e "\nInstalling Rust Lang"
	sudo apt update && sudo apt install -y curl
	curl -sSf https://static.rust-lang.org/rustup.sh | sudo sh
	echo "Rust installed"
}

##
# External: Node.js installation.
##
function install_ext_node()
{
	echo -e "\nInstalling Node.js"
	sudo apt update && sudo apt install -y curl
	curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
	sudo apt install -y nodejs
	echo "Node.js insalled"
}

##
# External: Docker installation.
##
function install_ext_docker()
{
	echo -e "\nInstalling Docker"
	sudo apt install -y apt-transport-https ca-certificates
	sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

	file_tmp="/tmp/docker.list"
	file_dst="/etc/apt/sources.list.d/docker.list"

	if [ -f "$file_tmp" ]
	then
		rm $file_tmp
	fi
	touch $file_tmp

	if [ $DIST_N == "Ubuntu" ]
	then

		if [ $DIST_V == "16.04" ]
		then
			echo -e "deb https://apt.dockerproject.org/repo ubuntu-xenial main" >> $file_tmp


		elif [ $DIST_V == "14.04" ]
		then
			echo -e "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> $file_tmp
		fi

	elif [ $DIST_N == "LinuxMint" ]
	then

			if [ $DIST_V == "18" ]
			then
				echo -e "deb https://apt.dockerproject.org/repo ubuntu-xenial main" >> $file_tmp
			fi
	fi

	if [ -f "$file_dst" ]
	then
		sudo rm $file_dst
	fi
	sudo cp $file_tmp $file_dst

	sudo apt update
	sudo apt install -y docker-engine
	sudo usermod -aG docker $USER
	echo "Docker installed"
}

## Warning msg on start
if [ $DIST_N == "Ubuntu" ]
then
	whiptail --title "Missing Package Installer V$VER" --msgbox "This script supports (x)ubuntu 16.04 and 14.04 at the moment.\nAnd as always: use at your own risk." 8 78
else
	whiptail --title "Missing Package Installer V$VER" --msgbox "This script was tested only with (x)ubuntu 16.04 and 14.04 yet.\nIt may not work properly on other distribution.\n\nUse at your own risk." 10 78
fi

## Choose dialog
DISTROS=$(whiptail --title "Missing Package Installer V$VER" --checklist \
"Choose missing software packages to install" 27 66 21 \
$NAME_SYSTEM " - System core software" OFF \
$NAME_DEV " - Development software" OFF \
$NAME_MEDIA " - Multimedia software" OFF \
$NAME_OFFICE " - Office software" OFF \
$NAME_LATEX " - LaTeX software"  OFF \
$NAME_INET " - Internet software" OFF \
$NAME_GFX " - Graphics software" OFF \
$NAME_GAMES " - Just some FOSS Games" OFF \
$NAME_PPA_JAVA " - Oracle Java 8" OFF \
$NAME_PPA_GIT " - The latest Git" OFF \
$NAME_PPA_LIBREOFFICE " - The latest LibreOffice" OFF \
$NAME_PPA_KODI " - The latest Kodi" OFF \
$NAME_PPA_VLC " - The latest VLC" OFF \
$NAME_PPA_PAPIRUS " - Papirus Icon Theme" OFF \
$NAME_PPA_ATOM " - Atom hackable text editor" OFF \
$NAME_PPA_HIPCHAT " - Atlassian HipChat4" OFF \
$NAME_EXT_RUST " - Install Rust Language" OFF \
$NAME_EXT_NODE " - Install Node.js" OFF \
$NAME_EXT_DOCKER " - Install Docker" OFF \
$NAME_SCRIPT_UPDATE " - A system update script" OFF \
$NAME_SCRIPT_KERNEL " - A script to remove unused kernels " OFF \
3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then

	## Update the system first
	update_packages

	## Scripts
	case "${DISTROS[@]}" in  *$NAME_SCRIPT_UPDATE*)
		install_update_script ;; esac

	case "${DISTROS[@]}" in  *$NAME_SCRIPT_KERNEL*)
		install_kernel_script ;; esac


	## Install main packages first
	packages=""
	case "${DISTROS[@]}" in *$NAME_SYSTEM*)
		packages="$packages "$PKG_SYS ;; esac

	case "${DISTROS[@]}" in *$NAME_MEDIA*)
		packages="$packages "$PKG_MEDIA ;; esac

	case "${DISTROS[@]}" in *$NAME_OFFICE*)
		packages="$packages "$PKG_OFFICE ;; esac

	case "${DISTROS[@]}" in *$NAME_LATEX*)
		packages="$packages "$PKG_LATEX ;; esac

	case "${DISTROS[@]}" in *$NAME_INET*)

		if [ $DIST_V == "16.04" ]
		then
			packages="$packages "$PKG_INET

		elif [ $DIST_V == "14.04" ]
		then
			packages="$packages "$PKG_INET_14
		fi
		;; esac

	case "${DISTROS[@]}" in *$NAME_GFX*)
		packages="$packages "$PKG_GFX ;; esac

	case "${DISTROS[@]}" in *$NAME_GAMES*)
		packages="$packages "$PKG_GAMES ;; esac

	if [ ! -z "$packages" -a "$packages" != " " ]; then
       		install_packages $packages
	fi


	## PPAs
	case "${DISTROS[@]}" in *$NAME_PPA_PAPIRUS*)
		install_PPA_papirus ;; esac

	case "${DISTROS[@]}" in *$NAME_PPA_KODI*)
		install_PPA_Kodi ;; esac

	case "${DISTROS[@]}" in *$NAME_PPA_VLC*)
		install_PPA_VLC ;; esac

	case "${DISTROS[@]}" in *$NAME_PPA_JAVA*)
		install_PPA_Java ;; esac

	case "${DISTROS[@]}" in *$NAME_PPA_LIBREOFFICE*)
		install_PPA_LibreOffice ;; esac

	case "${DISTROS[@]}" in *$NAME_PPA_GIT*)
		install_PPA_Git ;; esac

	case "${DISTROS[@]}" in *$NAME_PPA_ATOM*)
		install_PPA_Atom ;; esac

	case "${DISTROS[@]}" in *$NAME_PPA_HIPCHAT*)
		install_PPA_HIPCHAT ;; esac


	## External
	case "${DISTROS[@]}" in *$NAME_EXT_RUST*)
		install_ext_rust ;; esac

	case "${DISTROS[@]}" in *$NAME_EXT_NODE*)
		install_ext_node ;; esac

	case "${DISTROS[@]}" in *$NAME_EXT_DOCKER*)
		install_ext_docker ;; esac

else
    	echo "Package installation aborted."
fi
