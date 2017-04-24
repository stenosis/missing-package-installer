# missing-package-installer
*missing package installer (mpi)* is  a simple bash script to install some of the missing software (i like to use) on a fresh installation of (x)ubuntu 16.04 or 14.04. It has the simple purpose to automate the installation of some packages. Therefore the selecetion of the software packages are based and tended on my own opinion. The script was tested only on xubuntu 16.04, 14.04 and LinuxMint 18 (XFCE).

Simply choose from a variety of software package categories you would like to install.<br>
And as always: if you find it usefull, use it at your own risk.

![missing package installer](/img/mpi.png "missing package installer")

---
## Package Description
Following packages can be installed with *mpi*:

### System packages
`mc htop iftop conky imwheel curl keepassx gufw gparted p7zip-full bleachbit compton wmctrl kdocker terminator scrot redshift gtk-redshift synaptic aptitude cups csh lib32stdc++6`

### Developer packages
`build-essential gdb git tig python-pip monodevelop mono-runtime geany geany-common netbeans`

### Media packages
`vlc soundconverter easytag sound-juicer libdvdread4 brasero ubuntu-restricted-extras`

### Office packages
`pdfshuffler pdfchain libreoffice-impress`

### LaTeX packages
`texstudio lyx lyx-common`

### Internet packages
###### Ubuntu 16.04
`mumble corebird filezilla polari`
###### Ubuntu 14.04
`mumble filezilla xchat-gnome`

### Graphics packages
`imagemagick inkscape gimp xsane`

### Game packages
`wesnoth hedgewars gweled scummvm burgerspace`

### PPA-Java (Oracle Java 8)
“WebUpd8” team - Oracle Java (JDK) 8 Installer.<br>
https://launchpad.net/~webupd8team/+archive/ubuntu/java

### PPA-Git
Git stable releases.<br>
https://launchpad.net/~git-core/+archive/ubuntu/ppa

### PPA-LibreOffice
LibreOffice stable releases.<br>
https://launchpad.net/~libreoffice/+archive/ubuntu/ppa

### PPA-Kodi
Kodi stable releases.<br>
https://launchpad.net/~team-xbmc/+archive/ubuntu/ppa

### PPA-VLC
VLC Daily Build of stable branch<br>
https://launchpad.net/~videolan/+archive/ubuntu/stable-daily

### PPA-Atom Editor
GitHub's Atom, the hackable text editor.
https://launchpad.net/~webupd8team/+archive/ubuntu/atom/+index <br>
Includes following addons:
- platformio-ide-terminal
- language-vue  
- language-ini
- terminal-plus
- python-debugger
- git-time-machine
- git-plus
- autocomplete-python
- activate-power-mode
- pdf-view
- minimap
- project-manager
- bottom-dock
- gulp-manager
- todo-manager
- symbols-tree-view
- pigments
- highlight-selected
- minimap-highlight-selected
- rest-client

### PPA-Atlassian HipChat
Group and private chat, file sharing, and integrations.<br>
https://de.atlassian.com/software/hipchat

### PPA-Papirus icon theme
Papirus is a free and open source SVG icon theme for Linux.<br>
https://launchpad.net/~papirus/+archive/ubuntu/papirus<br>
https://github.com/PapirusDevelopmentTeam/papirus-icon-theme

### Rust Language
The Rust Programming Language.<br>
https://www.rust-lang.org/en-US/downloads.html

### Node.js
Simply Node.js.<br>
https://nodejs.org/en/download/package-manager/

### Docker
Docker container engine.<br>
https://docs.docker.com/engine/installation/linux/ubuntulinux/

### A script to update the system
A script called `mkupdate` gets copied to `/usr/bin/` for updating the system.<br>

### A script to remove old unused kernels
A script called `remove-old-kernels` gets copied to `/usr/bin/` for removing old and unused kernels.<br>

---
No black magic involved.<br>
This script was designed for my own need. If you find this script usefull than it's fine. Use it at your own risk.
