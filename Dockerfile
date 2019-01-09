FROM ubuntu:18.04
MAINTAINER Darius Felski
LABEL Description="Visual Studio Code" Version="1.30.2"

ARG VSCODE_VERSION=1.30.2-1546901646

# install some basics first
RUN apt update && apt install -y software-properties-common apt-transport-https wget curl

# add vscode repository
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# update packages
RUN apt-get update && apt-get upgrade -y

# install some dependencies to run vscode gui properly
RUN apt install -y libasound2 git

# install vscode
RUN apt install -y code=${VSCODE_VERSION}

CMD ["/usr/share/code/code"]
