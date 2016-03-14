#!/bin/bash

echo "root:$ROOT_PASS" | chpasswd

sed -i "s/x-www-browser/winecfg/g" /etc/xdg/openbox/menu.xml


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

exec /usr/sbin/sshd -D
