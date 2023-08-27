import re
import requests


def get_pkgver():
    url = "https://dl.todesktop.com/230313mzl4w4u92/linux/appImage/x64"
    r = requests.get(url, headers={'Range': 'bytes=0-0'})
    ver = re.search(r'cursor-(\d+\.\d+\.\d+)', r.headers["content-disposition"]).group(1)
    return ver


def update_pkgver():
    pkgbuild = "../cursor-appimage/PKGBUILD"
    with open(pkgbuild, "r") as f:
        lines = f.readlines()
    for i, line in enumerate(lines):
        if line.startswith("pkgver="):
            lines[i] = f"pkgver={get_pkgver()}\n"
            break
    with open(pkgbuild, "w") as f:
        f.writelines(lines)


if __name__ == "__main__":
    print(get_pkgver())
    update_pkgver()
    

