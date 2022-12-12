##
# Source setup helper functions
source $ZDOTDIR/zshfunctions

# External configuration sourcing
# Export my environment variables
if [ -f $ZDOTDIR/zshexports 2> /dev/null ]; then
	source $ZDOTDIR/zshexports
else
	print "Note: $ZDOTDIR/zshexports is unavailable."
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

# Test and then source colour palette
# {{{
if [ -f $ZDOTDIR/functions/colours 2> /dev/null ]; then
	source $ZDOTDIR/functions/colours
else
	print "Note: Colour pallete could not be loaded."
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
### Added by Zinit's installer
if [[ ! -f $HOME/.config/zsh/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.config/zsh/.zinit" && command chmod g-rwX "$HOME/.config/zsh/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.config/zsh/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi


source "$HOME/.config/zsh/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

source "$ZDOTDIR/zinit.plugins"

compdef _gnu_generic ls grep journalctl

#vim: fdm=marker

export PATH="$HOME/code/kde/src/kdesrc-build:$PATH"

if [[ -f /usr/share/nvm/init-nvm.sh ]]; then
	source /usr/share/nvm/init-nvm.sh
fi
