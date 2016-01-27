FROM ubuntu:14.10
MAINTAINER gaoal "keepob@163.com"

#ADD sources.list /etc/apt/sources.list
ADD run.sh /run.sh

RUN apt-get update && \
    apt-get -y install openssh-server openbox thunar tint2 vnc4server vim axel screen curl && \
    mkdir -p /var/run/sshd;cd /root && \
    curl -O http://nchc.dl.sourceforge.net/project/ubuntuzilla/mozilla/apt/pool/main/f/firefox-mozilla-build/firefox-mozilla-build_27.0.1-0ubuntu1_amd64.deb && \
    curl -O https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-64-bit.deb && \
    apt-get -y install libappindicator3-1 && dpkg -i *.deb && \
    apt-get -y install flashplugin-nonfree && \
    apt-get -y install software-properties-common && add-apt-repository ppa:ubuntu-wine/ppa && \
    apt-get update && apt-get -y install wine1.7 && \
    axel -n 50 -q http://lastmile.gomez.com/PEERInstall.exe && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    chmod 755 /run.sh && \
    rm -rf /var/lib/apt/lists/*

ENV ROOT_PASS=123456
VOLUME  ["/data"]

EXPOSE 22 5901
CMD ["/run.sh"]
