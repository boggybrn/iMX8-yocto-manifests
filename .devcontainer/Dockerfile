FROM ubuntu:22.04

# Avoid prompt interruptions during package installation
ENV DEBIAN_FRONTEND=noninteractive

# 1. Force enable universe/multiverse repos & install updated dependencies
RUN apt-get update && apt-get install -y software-properties-common \
    && add-apt-repository universe \
    && add-apt-repository multiverse \
    && apt-get update && apt-get install -y \
    gawk wget git diffstat unzip texinfo gcc build-essential \
    chrpath socat cpio python3 python3-pip python3-pexpect \
    xz-utils debianutils iputils-ping python3-git python3-jinja2 \
    libegl1-mesa libsdl1.2-dev pylint xterm rsync curl locales \
    bmap-tools libssl-dev bc lz4 zstd repo file \
    && rm -rf /var/lib/apt/lists/*

# Set up the locale (Yocto requires UTF-8)
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Create a non-root user matching host UID/GID dynamically at build time
ARG USER_NAME
ARG USER_UID
ARG USER_GROUPS
RUN useradd  ${USER_NAME} -d /home/${USER_NAME} -u ${USER_UID} -s /bin/bash && mkdir -p /home/${USER_NAME} && chown ${USER_NAME} /home/${USER_NAME} 
RUN for GROUP in `echo ${USER_GROUPS}|tr ',' '\n'` ; do groupadd  user${GROUP} -f -g ${GROUP} ; done
RUN usermod -aG ${USER_GROUPS} ${USER_NAME}
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}