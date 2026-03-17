#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
# pacman -Syu --noconfirm PACKAGESHERE

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common

echo "Getting binary..."
echo "---------------------------------------------------------------"
BINARY=https://github.com/gopher64/gopher64/releases/latest/download/gopher64-linux-$ARCH
mkdir -p ./AppDir/bin
wget --retry-connrefused --tries=30 "$BINARY" -O ./AppDir/bin/gopher64
chmod +x ./AppDir/bin/gopher64
./AppDir/bin/gopher64 --version | awk '{print $2; exit}' > ~/version

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here

# if you also have to make nightly releases check for DEVEL_RELEASE = 1
#
# if [ "${DEVEL_RELEASE-}" = 1 ]; then
# 	nightly build steps
# else
# 	regular build steps
# fi
