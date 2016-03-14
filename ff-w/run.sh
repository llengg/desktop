#!/bin/bash

echo "root:$ROOT_PASS" | chpasswd
sed -i "s/x-www-browser/\/opt\/firefox\/firefox/g" /etc/xdg/openbox/menu.xml
sed -i "s/x-terminal-emulator/\/usr\/bin\/lantern/g" /etc/xdg/openbox/menu.xml

cat > /root/ff <<EOF
#!/bin/bash
while true; do
for (( i=0; i<72; i++ ))
{
sleep 5m
[ -z "`ps -ef | grep firefox| grep -v grep`" ] && export DISPLAY=0:1 && nohup /opt/firefox/firefox & > /dev/null 2>&1
}
kill -s 9 $(pgrep firefox) ; sleep 3s ; rm -rf $(find ~ -name sessionstore.js)
date -R >> /root/log
done
EOF

cat > /root/xstartup <<EOF
#!/bin/sh
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
tint2 -c /etc/xdg/tint2/tint2rc &
thunar &
openbox-session &
EOF

#echo -e 'MAILTO=gaoal@dagene.net\n59 13 * * * kill $(pgrep firefox) ; sleep 3s ; rm -rf $(find ~ -name sessionstore.js)' \
#        > /var/spool/cron/crontabs/root
#chmod 600 /var/spool/cron/crontabs/root
#chown root.crontab /var/spool/cron/crontabs/root

exec /usr/sbin/sshd -D
