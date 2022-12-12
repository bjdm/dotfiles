#!/bin/bash

# Handles initial setup on a new system.

# A bit of bash witch craft to get the directory of the script
# {{{
# https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
# Gets location of script currently being run regardless of where it is called from

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# }}}


printf "BOOTSTRAPPING ZSH\n\n"
printf "Exporting ZDOTDIR to environment.\n"
# Set ZDOTDIR in /etc/zshenv to current directory for portability
if [[ ! -f /etc/zsh/zshenv ]]; then 
	printf "/etc/zsh/zshenv does not exist. Create it now?\n"
	select yn in "Yes" "No"; do
    	case $yn in
        	Yes ) printf "\n/etc/zsh/zshenv now contains: \n"; sudo -u root touch /etc/zsh/zshenv; echo "export ZDOTDIR=$DIR" | sudo -u root tee /etc/zsh/zshenv ; break;;
        	No ) exit;;
    	esac
	done
else
	printf "/etc/zsh/zshenv exists.\n"
	printf "It currently contains: \n $(sudo -u root cat /etc/zsh/zshenv)\n\n"
	printf "Do you want to replace it?\n"
	select yn in "Yes" "No"; do
    	case $yn in
        	Yes ) printf "\n/etc/zsh/zshenv now contains: \n"; printf "export ZDOTDIR=$DIR" | sudo -u root tee /etc/zsh/zshenv ; break;;
        	No ) exit;;
    	esac
	done
fi

printf "\nDone.\n\n"
