FROM archlinux/base
RUN pacman -Syu git --noconfirm
RUN git clone https://aur.archlinux.org/yay.git
RUN cd yay
RUN makepkg -si
RUN yay -Syu wpgtk-git --noconfirm
