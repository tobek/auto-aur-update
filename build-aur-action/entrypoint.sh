#!/bin/bash

soucename=$1
pkgdir=$1

useradd builder -m
echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chmod -R a+rw .

pacman-key --init
pacman -Sy --noconfirm &&

cd $pkgdir

ver=$(curl -s https://api.github.com/repos/$soucename/releases/latest | jq '.tag_name'|tr -d 'v"')
sed -i "s/pkgver=.*/pkgver=$ver/" PKGBUILD
cd -

#cd icalingua++

#ver_ica=$(curl -s https://api.github.com/repos/Icalingua-plus-plus/Icalingua-plus-plus/releases/latest | jq '.tag_name'|tr -d 'v"')
#sed -i "s/pkgver=.*/pkgver=$ver_ica/" PKGBUILD
#sudo -u builder  updpkgsums

#rm app-aarch64-$ver_ica.asar app-x86_64-$ver_ica.asar 
#cd -



#cd listen1

#ver_lis=$(curl -s https://api.github.com/repos/listen1/listen1_desktop/releases/latest | jq '.tag_name'|tr -d 'v"')
#sed -i "s/pkgver=.*/pkgver=$ver_lis/" PKGBUILD
#sudo -u builder  updpkgsums

#rm listen1_$ver_lis_linux_amd64.deb
#cd -

#cd listen1-electron
#sed -i "s/pkgver=.*/pkgver=$ver_lis/" PKGBUILD
#sudo -u builder  updpkgsums
#cd -

#cd clash-for-windows-electron-zh

#ver_cfw=$(curl -s https://api.github.com/repos/Fndroid/clash_for_windows_pkg/releases/latest | jq '.tag_name'|tr -d 'v"')
#sed -i "s/pkgver=.*/pkgver=$ver_cfw/" PKGBUILD
#sudo -u builder  updpkgsums

#rm clash-for-windows-electron-zh-${ver_cfw}-x86_64-linux.tar.gz app.asar
#cd -

#cd sabaki-electron

#ver_sbk=$(curl -s https://api.github.com/repos/SabakiHQ/Sabaki/releases/latest | jq '.tag_name'|tr -d 'v"')
#sed -i "s/pkgver=.*/pkgver=$ver_sbk/" PKGBUILD
#sudo -u builder  updpkgsums

#rm v${ver_cfw}.tar.gz
#cd -

#echo OK
