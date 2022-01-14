#!/usr/bin/env bash

usage() { echo "Usage: $0 -p <project directory>" 1>&2; exit 1; }

CONTAINER="esp32-container-rust:latest"

LNCMD="ln -s /opt/esp/idf/components/bt/host/nimble/nimble/nimble/host/services/gap/include/services /project/.embuild/platformio/packages/framework-espidf/components/bt/include/esp32/include"

while getopts "d:" o; do
    case "${o}" in
		d)
			d=${OPTARG}
			;;
		*)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${d}" ]; then
    d=/dev/ttyUSB0
fi

# check if podman or docker is installed
if [ -x "$(command -v podman)" ]; then
    echo 'Found podman installation' >&2
    CMD=podman
elif [ -x "$(command -v docker)" ]; then
    echo 'Found docker installation' >&2
    CMD=docker
else 
    echo 'Found neither docker nor podman installation' >&2
    exit 1
fi

$CMD run --rm -it --name esp32-build-container --device ${d} -v /run/udev:/run/udev:ro \
	 --network host --privileged --workdir /project \
     $CONTAINER bash -lc "espmonitor $d" 
