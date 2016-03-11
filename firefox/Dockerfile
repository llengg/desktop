FROM debian:wheezy
MAINTAINER gaoal "keepob@163.com"

ADD sources.list /etc/apt/sources.list
ADD run.sh /run.sh

RUN apt-get update && \
    apt-get -y install openssh-server openbox thunar tint2 vnc4server vim screen wget && \
    mkdir -p /var/run/sshd;cd /root && \
    wget -O firefox9.deb http://iweb.dl.sourceforge.net/project/ubuntuzilla/mozilla/apt/pool/main/f/firefox-mozilla-build/firefox-mozilla-build_9.0.1-0ubuntu1_amd64.deb && \
    wget -O lantern.deb https://github.com/getlantern/lantern-binaries/blob/master/lantern-installer-64-bit.deb?raw=true && \
    apt-get -y install libappindicator3-1 && \
    dpkg -i *.deb && \
    chmod 755 /run.sh && \
    apt-get install flashplugin-nonfree -y && \
    rm -rf /var/lib/apt/lists/* && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV ROOT_PASS=123456
VOLUME  ["/data"]

EXPOSE 22 5901
CMD ["/run.sh"]
