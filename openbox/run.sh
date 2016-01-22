#!/bin/bash

echo "root:$ROOT_PASS" | chpasswd

sed -i "s/x-www-browser/winecfg/g" /etc/xdg/openbox/menu.xml

#vncserver :1
#cat > /root/.vnc/xstartup <<EOF
##!/bin/sh
#[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
#[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
#xsetroot -solid grey
#vncconfig -iconic &
#x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
#x-window-manager &
#tint2 -c /etc/xdg/tint2/tint2rc &
#rox-filer &
#openbox-session &
#EOF
#chmod 755 /root/.vnc/xstartup

exec /usr/sbin/sshd -D
