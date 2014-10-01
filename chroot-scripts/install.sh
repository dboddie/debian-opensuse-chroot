#!/bin/bash

set -e

# http://blog.zenlinux.com/2011/02/how-to-setup-an-opensuse-chroot/
zypper ar http://download.opensuse.org/distribution/13.1/repo/oss/ repo-oss
zypper ar http://download.opensuse.org/repositories/Application:/Geo/openSUSE_13.1/ repo-oss-apps
zypper up
zypper install -y sudo man less vim

useradd -m -s /bin/bash build

echo "build ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
echo 'Defaults:build !requiretty' >> /etc/sudoers
