FROM debian:9.6
MAINTAINER Darius Felski
LABEL Description="Visual Studio Code" Version="1.32.1"

ARG VSCODE_VERSION=1.32.1-1552006243

# install vscode and related dependencies
RUN apt update \
  && apt install -y curl gpg apt-transport-https \
  \
  && curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
  && install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ \
  && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
  \
  && apt update -y \
  && apt install -y code=${VSCODE_VERSION} libasound2 git

CMD ["/usr/share/code/code"]
