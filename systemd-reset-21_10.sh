#!/bin/bash
mkdir systemd-tmp
wget http://launchpadlibrarian.net/399247908/libpam-systemd_229-4ubuntu21.10_armhf.deb -P systemd-tmp | wget http://launchpadlibrarian.net/399247910/libsystemd0_229-4ubuntu21.10_armhf.deb -P systemd-tmp | wget http://launchpadlibrarian.net/399247918/systemd_229-4ubuntu21.10_armhf.deb -P systemd-tmp | wget http://launchpadlibrarian.net/399247917/systemd-sysv_229-4ubuntu21.10_armhf.deb -P systemd-tmp
sudo dpkg -i systemd-tmp/libpam-systemd_229-4ubuntu21.10_armhf.deb systemd-tmp/libsystemd0_229-4ubuntu21.10_armhf.deb systemd-tmp/systemd_229-4ubuntu21.10_armhf.deb systemd-tmp/systemd-sysv_229-4ubuntu21.10_armhf.deb
rm systemd-tmp/libpam-systemd_229-4ubuntu21.10_armhf.deb | rm systemd-tmp/libsystemd0_229-4ubuntu21.10_armhf.deb | rm systemd-tmp/systemd_229-4ubuntu21.10_armhf.deb | rm systemd-tmp/systemd-sysv_229-4ubuntu21.10_armhf.deb
rmdir systemd-tmp
