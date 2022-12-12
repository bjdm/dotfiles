if ! pacman --query --quiet --info $1 &>/dev/null; then
	printf "Installing `$1`...\n"
	pacman --sync --quiet --info $1
fi
