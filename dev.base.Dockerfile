# file to make base developer setting
FROM ubuntu:22.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install vim sudo git -y
RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get install software-properties-common -y

# install basic libraries
RUN add-apt-repository ppa:openjdk-r/ppa -y
RUN apt-get install tmux build-essential perl wget gcc g++ zsh curl -y
RUN apt-get install libsm6 libxrender1 htop libfontconfig1 unzip libgl1-mesa-glx -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/cache/apt/archives/*

