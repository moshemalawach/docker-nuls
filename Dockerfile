FROM ubuntu:18.04
MAINTAINER Moshe Malawach <moshe.malawach@protonmail.com>

# https://github.com/docker-library/python/issues/13
ENV LANG C.UTF-8

RUN apt-get -y update
#RUN apt-get -y install megatools
RUN apt-get -y install wget axel
WORKDIR /
#run megadl 'https://mega.nz/#!76xgRAwY!gzBuFS459aCjmk-2Y9VYnHDgPLe4_UGPkAHQvgZek5M'
run axel https://nuls-usa-west.oss-us-west-1.aliyuncs.com/v1.1.0/NULS-Wallet-linux64-1.1.0.tar.gz
RUN mkdir /nuls
WORKDIR /nuls

RUN tar zxf ../NULS-Wallet-linux64-1.1.0.tar.gz
RUN rm ../NULS-Wallet-linux64-1.1.0.tar.gz

ADD launch.sh /
ADD modules.ini /nuls/conf/

RUN chmod +x /launch.sh

VOLUME /nuls/data /nuls/logs

EXPOSE 6001/tcp
EXPOSE 8016/tcp
EXPOSE 8016/udp
CMD ["/bin/bash", "/launch.sh"]
