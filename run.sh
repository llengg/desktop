#!/bin/bash
echo "root:$ROOT_PASS" | chpasswd

sed -i "s/x-www-browser/\/opt\/firefox\/firefox/g" /etc/xdg/openbox/menu.xml
sed -i "s/x-terminal-emulator/\/usr\/bin\/lantern/g" /etc/xdg/openbox/menu.xml

service vncserver start
sed -i "s/x-terminal-emulator/#x-terminal-emulator/g" /root/.vnc/xstartup
sed -i "s/x-window-manager/#x-window-manager/g" /root/.vnc/xstartup

echo -e "MAILTO=gaoal@dagene.net\n59 13 * * * kill $(pgrep firefox) ; sleep 3s ; rm -rf $(find ~ -name sessionstore.js)" \
        > /var/spool/cron/crontabs/root
chmod 600 /var/spool/cron/crontabs/root
chown root.crontab /var/spool/cron/crontabs/root
service cron restart

exec /usr/sbin/sshd -D
