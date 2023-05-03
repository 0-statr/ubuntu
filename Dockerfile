#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:22.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]



  #echo 'deb http://archive.ubuntu.com/ubuntu/ bionic universe' >> /etc/apt/sources.list && \
  #apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5 && \
  #apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 && \
  #apt update && \
  #apt -y install vnc4server && \
  #apt install xfce4 xfce4-goodies -y && \
  #apt-get install fluxbox && \
  #apt-get install lxde && \
  #apt-get install mate-desktop-environment-core && \
  #apt install firefox && \
  #apt-get install falkon && \

#create VNC password
#To run the VNC: sudo vncserver -geometry 1366x768
#Now, go to the container settings and do a port forwarding rule with the port: 5901
