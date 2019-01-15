# Systemd Downgrade for Ubuntu Xenial (armhf)
This repository includes two small bash scripts that up- or downgrade the current systemd version to either:
- **systemd-229-4ubuntu-21.11** or 
- **systemd-229-4ubuntu-21.10**

## Reason
With the release of **systemd-229-4ubuntu-21.9** and **>=systemd-229-4ubuntu-21.15** some services are no longer starting up correctly because the volatile path creation handled by **systemd-tmpfiles-setup** doesn't create all the necessary paths required by some services (e.g. OpenVPN, SSH, DNSMasq, Lighttpd, ...).

Hence I created two bash scripts which allow to easily and manually downgrade to the last two working versions of systemd that are still handling the volatile paths correctly.

## Installation
1. Download the bash files or the package (and extract the included files)
2. Make the files runnable `sudo chmod +x systemd-reset-21_10.sh` and `sudo chmod +x systemd-reset-21_11.sh`
3. Downgrade to specific version:
   - Execute `./systemd-reset-21_10.sh` if you want to switch to **systemd-229-4ubuntu-21.10**
   - Execute `./systemd-reset-21_11.sh` if you want to switch to **systemd-229-4ubuntu-21.11**
   - *[Optional] You can set the first parameter to mark all the packages to be `hold` with e.g. `./systemd-reset-XX_XX.sh 1`. By default the packages are not `hold`.*
   
The script will automatically download the files, install them manually with `dpkg -i` and finally remove the temp folder and the downloaded package files.
   
## Package Repositories / Resources
The up- / downgrade includes the following packages from the linked repositories:
- [libpam-systemd](https://launchpad.net/ubuntu/xenial/armhf/libpam-systemd)
- [libsystemd0](https://launchpad.net/ubuntu/xenial/armhf/libsystemd0)
- [systemd](https://launchpad.net/ubuntu/xenial/armhf/systemd)
- [systemd-sysv](https://launchpad.net/ubuntu/xenial/armhf/systemd-sysv/)

## Relevant Resources
- [Launchpad - 1804847](https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1804847)
- [Launchpad - 1804603](https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1804603)
- [Launchpad - 1811580](https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1811580)
- [Armbian - OrangePI](https://forum.armbian.com/topic/8852-ssh-doesnt-work-on-orange-pi-zero)
