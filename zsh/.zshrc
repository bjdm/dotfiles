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
#compdef _gnu_generic ls grep journalctl

#vim: fdm=marker

export PATH="$HOME/code/kde/src/kdesrc-build:$PATH"

if [[ -f /usr/share/nvm/init-nvm.sh ]]; then
	source /usr/share/nvm/init-nvm.sh
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
