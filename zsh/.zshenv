# .zshenv is sourced on all invoations of the shell, except when -f is set.
# It should contain commands to set command search path and other important
# environemnt variables.
# It should not contain any commands that produce output or assume the shell
# is connected to a tty

# Export XDG Base Directory spec in case it isn't set
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_RUNTIME_DIR=$HOME/.local/runtime

# Export ZDOTDIR for easy configuration
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export SUSPENDED_JOBS

# Export my local scripts to CONFIG_HOME
# Note: probably not the right place to stick these, but it allows for
# a more portable bootstrapping script
export PATH=$XDG_CONFIG_HOME/bin:$PATH
