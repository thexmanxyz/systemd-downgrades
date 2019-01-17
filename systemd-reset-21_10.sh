#!/bin/sh
if [ "$(id -u)" -eq 0 ]; then
  mkdir systemd-tmp >/dev/null 2>&1
  echo "Starting download..."
  wget http://launchpadlibrarian.net/399247908/libpam-systemd_229-4ubuntu21.10_armhf.deb -q -P systemd-tmp | wget http://launchpadlibrarian.net/399247910/libsystemd0_229-4ubuntu21.10_armhf.deb -q -P systemd-tmp | wget http://launchpadlibrarian.net/399247918/systemd_229-4ubuntu21.10_armhf.deb -q -P systemd-tmp | wget http://launchpadlibrarian.net/399247917/systemd-sysv_229-4ubuntu21.10_armhf.deb -q -P systemd-tmp
  echo "Updating systemd..."
  dpkg -i systemd-tmp/libpam-systemd_229-4ubuntu21.10_armhf.deb systemd-tmp/libsystemd0_229-4ubuntu21.10_armhf.deb systemd-tmp/systemd_229-4ubuntu21.10_armhf.deb systemd-tmp/systemd-sysv_229-4ubuntu21.10_armhf.deb >/dev/null 2>&1
  rm -r systemd-tmp >/dev/null 2>&1
  if [ ${1:-0} = "1" ]; then
    apt-mark hold libsystemd0 libpam-systemd systemd systemd-sysv >/dev/null 2>&1
	echo "The up-/downgrade of systemd to version 229-4ubuntu21.10 was successful, further updates set to hold."
  else
    echo "The up-/downgrade of systemd to version 229-4ubuntu21.10 was successful."
  fi
else
  echo "Beware, you have to run this script as root (sudo)!"
fi