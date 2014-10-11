#!/bin/bash

NAME="serf"
SERF_PKG_NAME="0.6.3_linux_amd64.zip"
SERF_PKG_URL="https://dl.bintray.com/mitchellh/serf/$SERF_PKG_NAME"
SERF_CFG_DIR="/etc/$NAME"
SERF_INSTALL_DIR="/usr/local/bin"


startup_script() {
	echo " * Installing startup scripts..."
	cp etc/init.d/$NAME /etc/init.d/
	cp etc/sysconfig/$NAME /etc/sysconfig/
}

setup_dirs() {
	echo " * Creating config directory..."
	[ -e "$SERF_CFG_DIR" ] || mkdir $SERF_CFG_DIR
	rsync -aH etc/$NAME/ $SERF_CFG_DIR
}

fetch_install_serf_bin() {
	if [ -e "$SERF_INSTALL_DIR/$NAME" ]; then
		echo " * Installing $NAME binary..."
		cd /tmp;
		wget "$SERF_BIN_URL";
		unzip $SERF_PKG_NAME -d $SERF_INSTALL_DIR;
		cd -
	else
		echo " * $NAME binary found!"
	fi
}

case "$1" in 
	all)
		install_serf_bins
		setup_dirs
		startup_script
		;;
	serf-service)
		setup_dirs
		startup_script
		;;
	serf)
		fetch_install_serf_bin
		;;
	*)
		echo -e "\n  Usage:\n"
		echo -e "    ./install.sh [ all | serf | serf-service ]\n"
		;;
esac
