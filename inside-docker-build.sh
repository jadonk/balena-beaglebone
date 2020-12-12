#!/bin/bash
set -e -x

# Create the normal user to be used for bitbake (barys)
echo "[INFO] Creating and setting builder user $BUILDER_UID:$BUILDER_GID."
groupadd -g $BUILDER_GID docker
useradd -m -u $BUILDER_UID -g $BUILDER_GID -G docker builder

# Start barys with all the arguments requested
echo "[INFO] Running build as builder user..."
sudo -H -u builder /yocto/resin-board/balena-yocto-scripts/build/barys -m beaglebone-green-wifi

