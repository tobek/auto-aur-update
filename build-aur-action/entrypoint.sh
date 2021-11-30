#!/bin/bash

useradd builder -m
echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chmod -R a+rw .

pacman-key --init
pacman -Sy --noconfirm &&

mkdir ~/.ssh

echo "$INPUT_PRIVATE_SSH_KEY" >> ~/.ssh/id_rsa
echo "$INPUT_KNOWN_HOSTS" >> ~/.ssh/known_hosts
chmod 600 ~/.ssh/*

echo '::group::Configuring git'
git config --global user.name "$INPUT_GIT_USERNAME"
git config --global user.email "$INPUT_GIT_EMAIL"
echo '::endgroup::'

git clone "ssh://aur@aur.archlinux.org/${INPUT_PKGNAME}.git"
cd ${INPUT_PKGNAME}

ver=$(curl -s https://api.github.com/repos/koreader/koreader/releases/latest | jq '.tag_name'|tr -d 'v"')
sed -i "s/pkgver=.*/pkgver=$ver/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
rm koreader-$ver-amd64.deb

git add .
git commit -m $(date +"%Y-%m-%d_%T")
git push
echo OK
