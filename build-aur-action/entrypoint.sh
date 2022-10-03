#!/bin/bash

useradd builder -m
echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chmod -R a+rw .

pacman-key --init
pacman -Sy --noconfirm &&

cd koreader-bin

ver_ko=$(curl -s https://api.github.com/repos/koreader/koreader/releases/latest | jq '.tag_name'|tr -d 'v"')
sed -i "s/pkgver=.*/pkgver=$ver_ko/" PKGBUILD
sudo -u builder  updpkgsums

rm koreader-$ver_ko-amd64.deb
cd -

# cd icalingua++

# ver_ica=$(curl -s https://api.github.com/repos/Icalingua-plus-plus/Icalingua-plus-plus/releases/latest | jq '.tag_name'|tr -d 'v"')
# sed -i "s/pkgver=.*/pkgver=$ver_ica/" PKGBUILD
# sudo -u builder  updpkgsums

# rm app-i686-$ver_ica.asar app-aarch64-$ver_ica.asar app-x86_64-$ver_ica.asar 
# cd -
cd listen1

ver_lis=$(curl -s https://api.github.com/repos/listen1/listen1_desktop/releases/latest | jq '.tag_name'|tr -d 'v"')
sed -i "s/pkgver=.*/pkgver=$ver_lis/" PKGBUILD
sudo -u builder  updpkgsums

rm listen1_$ver_lis_linux_amd64.deb
cd -

echo OK
