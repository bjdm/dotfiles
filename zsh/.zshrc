##
# Source setup helper functions
source $ZDOTDIR/zshfunctions

# Initialize zgenom
if [[ ! -d ${HOME}/.local/share/zgenom ]]; then
	git clone https://github.com/jandamm/zgenom.git "${HOME}/.local/share/zgenom"
fi

# source zgenom and enable autoupdate
source "${HOME}/.local/share/zgenom/zgenom.zsh"
zgenom autoupdate

# if the init script doesn't exist, specify plugins
if ! zgenom saved; then
	source ${XDG_CONFIG_HOME}/zsh/plugins.zsh
fi

# Test and then source options
# {{{
if [ -f $ZDOTDIR/zshoptions 2> /dev/null ]; then
	source $ZDOTDIR/zshoptions
else
	print "Note: $ZDOTDIR/zshoptions is unavailable."
fi
#}}}

# Test aliases exist and import them
# {{{
if [ -d $ZDOTDIR/aliases 2> /dev/null ]; then
	if [ $(ls $ZDOTDIR/aliases | wc -l) -gt 0 ]; then 
		for file in $ZDOTDIR/aliases/**/*(.); do
			source "$file"
		done
	fi
else
	print "Note: $ZDOTDIR/aliases were not loaded."
fi
#}}}

# Test and then source prompt
# {{{
if [ -f $ZDOTDIR/zshprompt 2> /dev/null ]; then
	source $ZDOTDIR/zshprompt
else
	print "Note: $ZDOTDIR/zshprompt is unavailable."
fi
#}}}

# Test and then source options
# {{{
if [ -f $ZDOTDIR/zshoptions 2> /dev/null ]; then
	source $ZDOTDIR/zshoptions
else
	print "Note: $ZDOTDIR/zshoptions is unavailable."
fi
#}}}

# Test and then source completions palette
# {{{
if [ -d $ZDOTDIR/completions 2> /dev/null ]; then
	if [ $(ls $ZDOTDIR/completions | wc -l) -gt 0 ]; then 
		for file in $ZDOTDIR/completions/**/*(.); do
			source "$file"
		done
	fi
else
	print "Note: Completions could not be loaded."
fi
#}}}


# turn off global variable warning because apparently plugin
# authors love global variables :(
# {{{
unsetopt warn_create_global
#}}}

setopt warn_create_global

# Load keybindings after all plugins have been installed
# Test and then source ZLE configuration
# {{{
if [ -f $ZDOTDIR/zshkeybindings 2>/dev/null ]; then
	printf "Sourcing keybindings.\n"
	source $ZDOTDIR/zshkeybindings
else
	printf "Note: $ZDOTDIR/zshkeybindings is unavailable."
fi

#}}}

# Styles
source "$ZDOTDIR/zshstyle"

#vim: fdm=marker

# kdesrc-build ##################################################

## Add kdesrc-build to PATH
export PATH="$HOME/code/kde/src/kdesrc-build:$PATH"

## Run projects built with kdesrc-build
function kdesrc-run
{
  source "$HOME/code/kde/build/$1/prefix.sh" && "$HOME/code/kde/usr/bin/$@"
}
#################################################################
#compdef _gnu_generic ls grep journalctl

#vim: fdm=marker

export PATH="$HOME/code/kde/src/kdesrc-build:$PATH"

if [[ -f /usr/share/nvm/init-nvm.sh ]]; then
	source /usr/share/nvm/init-nvm.sh
fi

zstyle ':completion:*' menu select
