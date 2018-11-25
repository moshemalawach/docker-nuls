FROM ubuntu:18.04
LABEL maintainer "Moshe Malawach <moshe.malawach@protonmail.com>"
LABEL maintainer "Angel Manzano <amalcaraz89@gmail.com>"

RUN apt-get -y update && \
    apt-get -y install wget axel

WORKDIR /nuls

RUN axel http://nuls-usa-west.oss-us-west-1.aliyuncs.com/1.1.4/NULS-Wallet-linux64-1.1.4.tar.gz

RUN tar zxf NULS-Wallet-linux64-1.1.4.tar.gz
RUN rm NULS-Wallet-linux64-1.1.4.tar.gz

ADD launch.sh /
ADD modules.ini /nuls/conf/

RUN chmod +x /launch.sh

VOLUME /nuls/data /nuls/logs

EXPOSE 6001/tcp
EXPOSE 8016/tcp
EXPOSE 8016/udp
CMD ["/bin/bash", "/launch.sh"]
