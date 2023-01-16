cd listen1

ver_lis=$(curl -s https://api.github.com/repos/listen1/listen1_desktop/releases/latest | jq '.tag_name'|tr -d 'v"')
sed -i "s/pkgver=.*/pkgver=$ver_lis/" PKGBUILD
sudo -u builder  updpkgsums

rm listen1_$ver_lis_linux_amd64.deb
cd -
