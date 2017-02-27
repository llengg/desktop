#!/bin/bash

echo "root:$ROOT_PASS" | chpasswd

sed -i "s/x-www-browser/\/opt\/firefox\/firefox/g" /etc/xdg/openbox/menu.xml

cat > /root/xstartup <<EOF
#!/bin/sh
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r \$HOME/.Xresources ] && xrdb \$HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
tint2 -c /etc/xdg/tint2/tint2rc &
openbox-session &
EOF

cat > /root/autorun <<EOF
#!/bin/bash
while true; do
for (( i=0; i<60; i++ ))
{
sleep 2m
[ -z "\`ps -ef | grep firefox| grep -v grep\`" ] && export DISPLAY=0:1 && nohup /opt/firefox/firefox & > /dev/null 2>&1 &
}
kill -s 9 \$(pgrep firefox) ; sleep 3s ; rm -rf \$(find ~ -name sessionstore.js)
done
EOF

cat > /root/revnc <<EOF
vncserver -kill :1 && vncserver :1
EOF

exec /usr/sbin/sshd -D
