#!/bin/bash -x
GID=$(getent group docker | cut -d: -f3)
docker run \
	-e BUILDER_UID=$(id -u) -e BUILDER_GID=$GID \
	-v /home/jkridner/workspace/balena-beaglebone:/yocto/resin-board \
	-v /var/run/docker.sock:/var/run/docker.sock \
	--privileged \
	-it resin/yocto-build-env \
	./inside-docker-build.sh
