FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y texlive-full python-sphinx
