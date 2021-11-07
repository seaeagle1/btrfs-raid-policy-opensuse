#!/bin/sh
BASEVERSION="5.3"
BRANCH="btrfs-raid-policy"

chmod +x apply-patches
chmod +x guards

rm -rf tmpbuild
mkdir tmpbuild
cd tmpbuild
mkdir linux-$BASEVERSION
cd linux-$BASEVERSION
git clone https://github.com/seaeagle1/btrfs-raid-policy-opensuse.git .
rm -r *
tar xf ../linux-$BASEVERSION.tar.xz

for i in arch drivers fixes rpmify suse kernel.org apparmor rt kabi
do
   tar xf ../patches.$i.tar.bz2
done

cd linux-$BASEVERSION
../../apply-patches ../../series.conf .. || true

git add .
git commit -m "Updating base"
git push
git checkout $BRANCH
echo "All set up, rebase branch (git rebase master), push (git push --force) and create patch (makepatch.sh)!"



