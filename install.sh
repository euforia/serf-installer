#!/bin/bash

SERF_PKG_NAME="0.6.3_linux_amd64.zip"
SERF_PKG_URL="https://dl.bintray.com/mitchellh/serf/$SERF_PKG_NAME"
SERF_CFG_DIR="/etc/serf"
SERF_INSTALL_DIR="/usr/local/bin"


startup_script() {
	cp -v etc/init.d/serf /etc/init.d/
	cp -v etc/sysconfig/serf /etc/sysconfig/
}

setup_dirs() {
	[ -e "$SERF_CFG_DIR" ] || mkdir $SERF_CFG_DIR
	rsync -vaH etc/serf/ $SERF_CFG_DIR
}

fetch_install_serf_bin() {
	[ -e "$SERF_INSTALL_DIR" ] || {
		cd /tmp;
		wget "$SERF_BIN_URL";
		unzip $SERF_PKG_NAME -d $SERF_INSTALL_DIR;
		cd -
	}
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
