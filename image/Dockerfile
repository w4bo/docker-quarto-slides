FROM ubuntu:26.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends pandoc curl gdebi-core python3 python3-pip libfontconfig xz-utils
ARG VERSION=1.10.18
RUN curl -L https://github.com/quarto-dev/quarto-cli/releases/download/v$VERSION/quarto-$VERSION-linux-amd64.deb -o quarto.deb
RUN gdebi --non-interactive quarto.deb
RUN quarto install tinytex
WORKDIR /data
