#!/bin/bash
echo "root:$ROOT_PASS" | chpasswd

service vncserver restart
sed -i "s/x-window-manager/gnome-session/g" /root/.vnc/xstartup

exec /usr/sbin/sshd -D
