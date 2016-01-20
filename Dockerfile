FROM debian:wheezy
MAINTAINER gaoal "keepob@163.com"

ADD sources.list /etc/apt/sources.list
ADD vncserver /etc/init.d/vncserver
ADD run.sh /run.sh

RUN apt-get update && \
    apt-get -y install openssh-server openbox thunar tint2 vnc4server curl vim screen cron && \
    mkdir -p /var/run/sshd;cd /root && \
    curl -O http://fh1331eh.bget.ru/files/firefox.deb && \
    curl -O http://fh1331eh.bget.ru/files/lantern.deb ; apt-get -y install libappindicator3-1 && \
    dpkg -i *.deb && \
    chmod +x /etc/init.d/vncserver && \
    chmod 755 /run.sh && \
    apt-get install flashplugin-nonfree -y && \
    rm -rf /var/lib/apt/lists/* && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV ROOT_PASS=123456
VOLUME  ["/data"]

EXPOSE 22 5901
CMD ["/run.sh"]
