cd koreader-bin

ver_ko=$(curl -s https://api.github.com/repos/koreader/koreader/releases/latest | jq '.tag_name'|tr -d 'v"')
sed -i "s/pkgver=.*/pkgver=$ver_ko/" PKGBUILD
sudo updpkgsums

rm koreader-${ver_ko}-amd64.deb koreader-${ver_ko}-arm64.deb
cd -
