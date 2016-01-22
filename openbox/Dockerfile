FROM ubuntu:12.04
MAINTAINER gaoal "keepob@163.com"

ADD sources.list /etc/apt/sources.list
ADD run.sh /run.sh

RUN apt-get update && \
    apt-get -y install openssh-server openbox rox-filer tint2 vnc4server wine1.7 axel && \
    mkdir -p /var/run/sshd;cd /root && \
    axel -q http://lastmile.gomez.com/PEERInstall.exe && \
    chmod 755 /run.sh && \
    rm -rf /var/lib/apt/lists/* && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV ROOT_PASS=123456
VOLUME  ["/data"]

EXPOSE 22 5901
CMD ["/run.sh"]
