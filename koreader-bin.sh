cd koreader-bin

ver_ko=$(curl -s https://api.github.com/repos/koreader/koreader/releases/latest | jq '.tag_name'|tr -d 'v"')
sed -i "s/pkgver=.*/pkgver=$ver_ko/" PKGBUILD
sudo -u builder  updpkgsums

rm koreader-v${ver_ko}-amd64.deb
cd -
