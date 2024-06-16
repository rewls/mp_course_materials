FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
	pacman -S --noconfirm base-devel ccache cmake git noto-fonts python \
	python-pip python-virtualenv qemu qemu-system-arm tk vim xterm && \
	useradd -m -s /bin/bash build && \
	echo "build ALL=(ALL:ALL) ALL" >> /etc/sudoers


USER build
RUN mkdir ~/microprocessor && \
	cd ~/microprocessor && \
	python -m venv .venv && \
	source .venv/bin/activate && \
	pip install ttkwidgets && \
	curl -O https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 && \
	mkdir ~/vendor && \
	cd ~/vendor && \
	git clone https://aur.archlinux.org/ncurses5-compat-libs.git && \
	cd ncurses5-compat-libs && \
	gpg --recv-keys 19882D92DDA4C400C22C0D56CC2AF4472167BE03 && \
	makepkg -src
	

USER root
RUN pacman -U --noconfirm /home/build/vendor/ncurses5-compat-libs/ncurses5-compat-libs-6.4-2-x86_64.pkg.tar.zst && \
	mkdir /opt/toolchain && \
	cd /opt/toolchain && \
	tar xfj /home/build/microprocessor/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 && \
	ln -s gcc-arm-none-eabi-10.3-2021.10/ gcc-arm-none-eabi

USER build
RUN cd ~/microprocessor && \
	echo "export PATH=\"/opt/toolchain/gcc-arm-none-eabi/bin:$PATH\"" >> ~/.bashrc && \
	git clone https://github.com/ubinos/ubiworks.git && \
	cd ubiworks && \
	git submodule update --init && \
	git submodule foreach git switch ubinos-main
