FROM ubuntu:18.04
MAINTAINER Moshe Malawach <moshe.malawach@protonmail.com>

# https://github.com/docker-library/python/issues/13
ENV LANG C.UTF-8

RUN apt-get -y update
RUN apt-get -y install megatools
WORKDIR /
run megadl 'https://mega.nz/#!76xgRAwY!gzBuFS459aCjmk-2Y9VYnHDgPLe4_UGPkAHQvgZek5M'
RUN mkdir /nuls
WORKDIR /nuls

RUN tar zxf ../NULS-Wallet-linux64-1.0.0.tar.gz
RUN rm ../NULS-Wallet-linux64-1.0.0.tar.gz

ADD launch.sh /

RUN chmod +x /launch.sh

VOLUME /nuls/data /nuls/logs

EXPOSE 6001/tcp
EXPOSE 6003/tcp
EXPOSE 6003/udp
CMD ["/bin/bash", "/launch.sh"]
