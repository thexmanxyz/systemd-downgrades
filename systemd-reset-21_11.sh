#!/bin/bash
mkdir systemd-tmp
wget http://launchpadlibrarian.net/401375344/libpam-systemd_229-4ubuntu21.11_armhf.deb -P systemd-tmp | wget http://launchpadlibrarian.net/401375346/libsystemd0_229-4ubuntu21.11_armhf.deb -P systemd-tmp | wget http://launchpadlibrarian.net/401375354/systemd_229-4ubuntu21.11_armhf.deb -P systemd-tmp | wget http://launchpadlibrarian.net/401375353/systemd-sysv_229-4ubuntu21.11_armhf.deb -P systemd-tmp 
sudo dpkg -i systemd-tmp/libpam-systemd_229-4ubuntu21.11_armhf.deb systemd-tmp/libsystemd0_229-4ubuntu21.11_armhf.deb systemd-tmp/systemd_229-4ubuntu21.11_armhf.deb systemd-tmp/systemd-sysv_229-4ubuntu21.11_armhf.deb
rm systemd-tmp/libpam-systemd_229-4ubuntu21.11_armhf.deb | rm systemd-tmp/libsystemd0_229-4ubuntu21.11_armhf.deb | rm systemd-tmp/systemd_229-4ubuntu21.11_armhf.deb | rm systemd-tmp/systemd-sysv_229-4ubuntu21.11_armhf.deb
rmdir systemd-tmp
if [ ${1:-0} == "1" ]
then
sudo apt-mark hold libsystemd0 libpam-systemd systemd systemd-sysv
fi