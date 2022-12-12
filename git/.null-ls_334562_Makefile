
bootstrap:
	# load in correct environment variables ie. correctly set $XDG_CONFIG_DIRS and $ZDOTDIR ln -sfv ${PWD}/zshenv ${HOME}/.zshenv


install:
	. ./zshenv
	ln -sfv ${PWD}/zshenv ${HOME}/.zshenv
	# a new process should be spawned with the proper environment namespace before continuing
	ln -sfv ${PWD} ${XDG_CONFIG_HOME}/zsh
