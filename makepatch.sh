#!/bin/sh
BASEVERSION="5.3"
BRANCH="btrfs-raid-policy"

cd tmpbuild
mkdir patches.addon
cd linux-$BASEVERSION
git format-patch master..$BRANCH --output ../patches.addon/$BRANCH
cd ..
tar -cvjSf patches.addon.tar.bz2 patches.addon
cd ..
cp tmpbuild/patches.addon.tar.bz2 ./
echo "Done, run osc commit to upload"
