#!/bin/bash

# Handles initial setup on a new system.

printf "Bootstrapping tmux and tmuxp\n\n"

# Install tmux if it isn't already {{{
if ! pacman --query --quiet --info tmux &>/dev/null; then
	printf "Installing tmux...\n"
	pacman --sync --quiet --info tmux
fi
#}}}

# Install tmuxp if it isn't already {{{
if ! pacman --query --quiet --info tmuxp &>/dev/null; then
	printf "Installing tmuxp...\n"
	pacman --sync --quiet --info tmuxp
fi
#}}}

# Link tmux config
if [ -f "$HOME"/.tmux.conf ]; then
	printf "Tmux config exists.\n"
else
	ln -sf "$(dirname "$(readlink -f "$0")")"/tmux.conf "$HOME"/.tmux.conf
	printf "Tmux config linked to %s.\n" "$HOME"
fi

if [ -d "$XDG_CONFIG_HOME/tmux" ]; then
	printf "Tmux config folder exists.\n"
else
	ln -sf "$(dirname "$(readlink -f "$0")")"/tmux "$XDG_CONFIG_HOME"/tmux
fi
## TODO setup tmuxp
if [ -d "$XDG_CONFIG_HOME/tmuxp" ]; then
	rm -r "$XDG_CONFIG_HOME"/tmuxp
fi
ln -sf "$(dirname "$(readlink -f "$0")")"/tmuxp "$XDG_CONFIG_HOME"/tmuxp
printf "Tmuxp config folder linked.\n"

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME"/tmux/plugins/tpm

printf "Finished bootstrapping tmux and tmuxp.\n"
printf "_______________________________________________\n\n"
