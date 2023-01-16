#!/bin/bash

pkgname=$1


useradd builder -m
echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chmod -R a+rw .

pacman-key --init
pacman -Sy --noconfirm &&

bash scripts/${pkgname}.sh

#echo OK
