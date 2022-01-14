FROM espressif/idf

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV RUSTUP_HOME=/opt/rustup
ENV CARGO_HOME=/opt/cargo
ENV PATH=/opt/cargo/bin:/opt/rustup/bin:/opt/esp/tools/xtensa-esp32-elf-clang/esp-13.0.0-20211203-x86_64-unknown-linux-gnu/bin/:$PATH

WORKDIR /opt

COPY install-rust-toolchain.sh .
RUN ./install-rust-toolchain.sh

RUN rustup default esp
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && apt-get install -y pkg-config && apt-get install -y libudev-dev
RUN cargo install espflash espmonitor

