#!/bin/sh
if [ "$(id -u)" -eq 0 ]; then
  mkdir systemd-tmp >/dev/null 2>&1
  echo "Starting download..."
  wget http://launchpadlibrarian.net/401375344/libpam-systemd_229-4ubuntu21.11_armhf.deb -q -P systemd-tmp | wget http://launchpadlibrarian.net/401375346/libsystemd0_229-4ubuntu21.11_armhf.deb -q -P systemd-tmp | wget http://launchpadlibrarian.net/401375354/systemd_229-4ubuntu21.11_armhf.deb -q -P systemd-tmp | wget http://launchpadlibrarian.net/401375353/systemd-sysv_229-4ubuntu21.11_armhf.deb -q -P systemd-tmp 
  echo "Updating systemd..."
  dpkg -i systemd-tmp/libpam-systemd_229-4ubuntu21.11_armhf.deb systemd-tmp/libsystemd0_229-4ubuntu21.11_armhf.deb systemd-tmp/systemd_229-4ubuntu21.11_armhf.deb systemd-tmp/systemd-sysv_229-4ubuntu21.11_armhf.deb >/dev/null 2>&1
  rm -r systemd-tmp >/dev/null 2>&1
  if [ ${1:-0} = "1" ]; then
    apt-mark hold libsystemd0 libpam-systemd systemd systemd-sysv >/dev/null 2>&1
	echo "The up-/downgrade of systemd to version 229-4ubuntu21.11 was successful, further updates set to hold."
  else
    echo "The up-/downgrade of systemd to version 229-4ubuntu21.11 was successful."
  fi
else
  echo "Beware, you have to run this script as root (sudo)!"
fi
