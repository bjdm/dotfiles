#!/bin/bash
# Handles initial setup on a new system.

# Install Zshell if it isn't already # {{{
printf "Bootstrapping Zshell...\n"

if ! pacman --query --quiet --info zsh &>/dev/null; then
	printf "Installing Zshell.\n"
	sudo pacman --sync --quiet --noconfirm zsh
fi
# }}}

# Set up all environment variables {{{

# }}}

# Symlink configs # {{{
# Symlink .zshenv to home directory. This is necessary to source $ZDOTDIR} before
# the rest of the login shell brings itself online.
if [[ -f $HOME/.zshenv ]]; then
	if grep -q "ZDOTDIR=\$XDG_CONFIG_HOME/zsh" "$HOME"/.zshenv; then
		printf "ZShell environment variables correctly set already.\n"
	else
		printf "ZShell environment setup exists, but is incorrect. Please remedy and try again.\n"
		exit 2
	fi
else
	printf "Symlinking zshenv to %s.\n" "$HOME"
	ln -sf "${get_abs_path}"/zsh/zshenv "$HOME"/.zshenv
fi
source "$HOME"/.zshenv &>/dev/null
printf 'Symlinking zsh config to XDG_CONFIG_HOME...\n'
ln -sf "$(dirname "$(readlink -f "$0")")"/zsh "$XDG_CONFIG_HOME"/zsh

# }}}



# Install antigen if it isn't
# {{{
if ! pacman --query --quiet --info antigen-git &>/dev/null; then
	if ! pacman --query --quiet --info yay &>/dev/null; then
		printf "Please install yay (AUR helper) first.\n"
		exit 1
	else
		printf "Installing antigen from AUR\n."
		yay --sync --quiet --noconfirm antigen-git
	fi
fi
	
#}}}

# Install additional completions from AUR {{{
if ! pacman --query --quiet --info &>/dev/null; then
	yay --sync --quiet --noconfrim zsh-completions
fi
#}}}

# Source zshrc to install plugins
printf "Installing Zshell plugins...\n"
#TODO the following command may create a wall of text. Is it worth
# suppressing the output at the risk of receiving no feedback?
#TODO maybe a PR to add a --quiet to antigen
/bin/zsh -i antigen
printf "Finished bootstrapping Zshell.\n"
printf "_______________________________________________\n\n"

# vim:fdm=marker
