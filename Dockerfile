FROM debian:wheezy
MAINTAINER gaoal "keepob@163.com"

ADD sources.list /etc/apt/sources.list
ADD vncserver /etc/init.d/vncserver
ADD run.sh /run.sh

RUN apt-get update && \
    apt-get -yq install x-window-system-core gnome-desktop-environment vnc4server curl && \
    mkdir -p /var/run/sshd && \
	cd /root
    curl -O https://github.com/getlantern/lantern-binaries/raw/master/lantern-installer-64-bit.deb && \
	dpkg -i lantern-installer-64-bit.deb && \
	apt-get install libappindicator3-1 -y && \
	chmod +x /etc/init.d/vncserver && \
	chmod 755 /run.sh && \
	rm -rf /var/lib/apt/lists/* && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV ROOT_PASS=123456

EXPOSE 22 5901
CMD ["/run.sh"]
