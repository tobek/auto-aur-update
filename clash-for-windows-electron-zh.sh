cd clash-for-windows-electron-zh

ver_cfw=$(curl -s https://api.github.com/repos/Fndroid/clash_for_windows_pkg/releases/latest | jq '.tag_name'|tr -d 'v"')
sed -i "s/pkgver=.*/pkgver=$ver_cfw/" PKGBUILD
sudo -u builder  updpkgsums

rm clash-for-windows-electron-zh-${ver_cfw}-x86_64-linux.tar.gz app.asar
cd -
