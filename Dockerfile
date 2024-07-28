FROM ubuntu:24.04
LABEL maintainer "Sebastian Daehne <daehne@rshc.de>"

RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y wget gnupg
RUN mkdir -p /etc/apt/keyrings && wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg https://apt.mopidy.com/mopidy.gpg

RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/bullseye.list
RUN apt-get update  && apt-get -y install mopidy mopidy-mpd mopidy-dleyna mopidy-podcast
#RUN pip3 install Mopidy-GMusic Mopidy-Youtube youtube-dl pyasn1

#COPY mopidy.conf /home/mopidy/.config/mopidy/mopidy.conf

USER mopidy
ENTRYPOINT ["/usr/bin/mopidy"]
