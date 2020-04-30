FROM ubuntu:18.04
MAINTAINER Agnes Kis

# Set up Bionic
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    tzdata \
    libssl-dev \
    openssl \
    zlib1g-dev \
    build-essential \
    checkinstall \
    libffi-dev \
    libsqlite3-dev \
    vim \
    curl \
    python3-pip \
    python3.7

# For x11
RUN apt-get install -qqy x11-apps

# Upgrade pip
RUN python3.7 -m pip install pip && python3.7 -m pip install --upgrade pip && python3.7 -m pip -V

# Set symlink to python and pip
RUN ln -s /usr/bin/python3.7 /usr/bin/python && ln -s /usr/local/bin/pip /usr/bin/pip

RUN mkdir /app
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt

# Change from root user for security reasons
RUN useradd -r -U -s /bin/bash pygameuser
RUN mkdir /shared && chown -R pygameuser:pygameuser /shared /app
USER pygameuser
