FROM ubuntu:14.04

MAINTAINER Ayoub Zaki <ayoub.zaki@embexus.com> 

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y software-properties-common curl

# Required Packages for the Host Development System
# http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#required-packages-for-the-host-development-system
RUN apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat libsdl1.2-dev xterm

# Update Python 2.7 version
RUN add-apt-repository -y ppa:jonathonf/python-2.7
RUN apt-get update
RUN apt-get install -y python2.7

# Update Python 3 version
RUN add-apt-repository -y ppa:jonathonf/python-3.6
RUN apt-get update
RUN apt-get install -y python3.6

# Add Android "repo" tool
RUN curl http://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
RUN chmod a+x /usr/local/bin/repo


# Create a non-root user that will perform the actual build
RUN id build 2>/dev/null || useradd --uid 1000 --create-home build
RUN apt-get install -y sudo
RUN echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

# Fix error "Please use a locale setting which supports utf-8."
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

USER build
WORKDIR /home/build
CMD ["/bin/bash"]

# EOF
