FROM ubuntu:24.04

RUN apt-get update \
 && apt-get install --no-install-recommends -y build-essential \
    gcc \
    unzip \
    wget \
    zip \
    gcc-avr \
    binutils-avr \
    avr-libc \
    avrdude \
    dfu-programmer \
    dfu-util \
    gcc-arm-none-eabi \
    binutils-arm-none-eabi \
    libnewlib-arm-none-eabi \
    python3 \
    python3-pip \
    python3-setuptools \
    git \
    pipx \
 && apt-get clean

USER ubuntu

RUN pipx install qmk
ENV PATH="$PATH:/home/ubuntu/.local/bin"

ENV keyboard=crkbd
ENV keymap=default

VOLUME /qmk
WORKDIR /qmk
