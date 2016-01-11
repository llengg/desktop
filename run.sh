#!/bin/bash
echo "root:$ROOT_PASS" | chpasswd

sed -i "s/x-www-browser/\/opt\/firefox\/firefox/g" /etc/xdg/openbox/menu.xml
sed -i "s/x-terminal-emulator/\/usr\/bin\/lantern/g" /etc/xdg/openbox/menu.xml

service vncserver start
sed -i "s/x-terminal-emulator/#x-terminal-emulator/g" /root/.vnc/xstartup
sed -i "s/x-window-manager/#x-window-manager/g" /root/.vnc/xstartup

exec /usr/sbin/sshd -D
