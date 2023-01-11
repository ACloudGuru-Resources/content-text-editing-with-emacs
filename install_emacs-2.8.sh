#!/bin/bash

#Install extras to build from source and download source tar
if [ -f /usr/bin/apt ] ; then
	apt install -y libncurses-dev libgnutls28-dev gnutls-bin pkg-config
else
	dnf install -y gcc make gnutls gnutls-devel ncurses ncurses-devel
fi

#Download Emacs 28.1 source package
wget https://ftp.gnu.org/gnu/emacs/emacs-28.1.tar.xz

#Untar the source and run the build and install
tar xvf emacs-28.1.tar.xz
cd emacs-28.1
./configure
make -j2
make install -j2

#Update any potential links
update-alternatives --install /usr/bin/emacs emacs /usr/local/bin/emacs 99

touch /tmp/emacs_done
