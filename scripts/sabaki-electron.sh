cd sabaki-electron

ver_sbk=$(curl -s https://api.github.com/repos/SabakiHQ/Sabaki/releases/latest | jq '.tag_name'|tr -d 'v"')
sed -i "s/pkgver=.*/pkgver=$ver_sbk/" PKGBUILD
sudo -u builder  updpkgsums

rm v${ver_cfw}.tar.gz
cd -
