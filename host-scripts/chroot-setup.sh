#!/bin/sh

. $PWD/opensuse-chroot-common.sh

export PREFIX=$PWD

echo "---------------------------------------------------------"
echo "Installing chroot at $CHROOT"
echo "---------------------------------------------------------"

set -e

mkdir -p $CHROOT/etc/yum.repos.d
cp $REPO_FILE $CHROOT/etc/yum.repos.d/

# Install yum in the chroot.
yum -y --installroot=$CHROOT install zypper.x86_64

#cp /etc/resolv.conf $CHROOT/etc/resolv.conf
#echo "DNS configuration copied"

$PREFIX/host-scripts/chroot-mount-proc.sh

echo "cp $PREFIX/chroot-scripts/*.sh $CHROOT/root/"
cp $PREFIX/chroot-scripts/*.sh $CHROOT/root/
echo "Files copied"

echo "Running installation scripts inside the chroot."
chroot $CHROOT /root/install.sh

echo "chroot $CHROOT is ready to use."
echo "Run host-scripts/chroot-enter.sh to enter it."
