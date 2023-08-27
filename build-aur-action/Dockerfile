FROM archlinux:latest

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN date
RUN pacman -Syu --noconfirm
RUN pacman -S base-devel git openssh pacman-contrib jq curl python-requests --noconfirm
COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"] 
