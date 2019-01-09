FROM debian:9.6
MAINTAINER Darius Felski
LABEL Description="Visual Studio Code" Version="1.30.2"

ARG VSCODE_VERSION=1.30.2-1546901646

# install some basics first
RUN apt update && apt install -y curl gpg apt-transport-https

# add vscode repository
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# update packages
RUN apt-get update -y

# install some dependencies to run vscode gui properly
RUN apt install -y libasound2 git

# install vscode
RUN apt install -y code=${VSCODE_VERSION}

CMD ["/usr/share/code/code"]
