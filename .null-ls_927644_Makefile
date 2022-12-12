XDG_CONFIG_HOME=${HOME}/.config

AUR_HELPER=paru -Syu

all: base paru neovim tmux zsh

scripts:
	ln -sfv ${PWD}/bin ${XDG_CONFIG_HOME}/bin

paru:
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
	cd ..
	rm -rf paru

neovim:
	$(AUR) neovim python-neovim
	ln -sfv ${PWD}/nvim ${XDG_CONFIG_HOME}/nvim

base:
	#include arch/Makefile/base

git:
	include git/Makefile

tmux:
	include tmux/Makefile

zsh:
	include zsh/Makefile
