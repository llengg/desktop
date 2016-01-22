#!/bin/bash

echo "root:$ROOT_PASS" | chpasswd

exec /usr/sbin/sshd -D
