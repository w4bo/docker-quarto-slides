FROM ubuntu:24.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends pandoc curl gdebi-core python3 python3-pip libfontconfig
ARG VERSION=1.6.40
RUN curl -L https://github.com/quarto-dev/quarto-cli/releases/download/v$VERSION/quarto-$VERSION-linux-amd64.deb -o quarto.deb
RUN gdebi --non-interactive quarto.deb
COPY requirements.txt .
RUN pip3 install -r requirements.txt --break-system-packages
RUN quarto install tinytex
WORKDIR /data
