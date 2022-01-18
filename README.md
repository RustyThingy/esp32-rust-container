# esp32-rust-container

This repository is a fork of [esp-rs/rust-build](https://github.com/esp-rs/rust-build) with additional support
of the [`espflash`](https://github.com/esp-rs/espflash) and [`espmonitor`](https://github.com/esp-rs/espmonitor) utilities.

The prebuilt container is available [at Dokerhub](https://hub.docker.com/r/kdvkrs/esp32-rust-container).

## Building the container

The `container` directory contains a build script `build.sh` that is used to build the container. Alternatively, the container can be built 
with tag `TAG` using

```bash
$ docker build -t TAG container
```

## Utility scripts

The `scripts` folder contains several utility scripts for building, flashing and monitoring the Docker container. 

- `build_project.sh` Executes `cargo build` in the directory given via the `-p` argument.
- `flash_monitor.sh` Executes `cargo espflash --monitor` in the directory given via the `-p` argument, building and flashing the project to the device given via the `-d` argument (not required, per default is `/dev/ttyUSB0`) and monitoring the serial output. The project can also be build in release mode using the `-r` flag.
- `flash_monitor.sh` Executes `cargo espflash` in the directory given via the `-p` argument, building and flashing the project to the device given via the `-d` argument (not required, per default is `/dev/ttyUSB0`). The project can also be build in release mode using the `-r` flag.
- `symlink.sh` Creates a symlink to the esp-idf header files in the `.embuild` directory of the project given with the `-p` argument. This may be required if esp-idf projects do not compile correctly.
- `open_shell.sh` Opens a `bash` shell in the docker container 
- `open_shell.sh` Monitors the device given with the `-d` argument with the `espmonitor` tool.
- `setup.sh` Downloads the prebuilt container if it is not present locally and installs the relevant udev rules for device usage, may be required for the container to work properly.