##### zsh configuration files

# Test and then source options
if [ -f $ZDOTDIR/zshoptions ]; then
	source $ZDOTDIR/zshoptions
else
	print "Note: `$ZDOTDIR`/zshoptions is unavailable."
fi

# Test and then source ZLE configuration
if [ -f $ZDOTDIR/zshaliases ]; then
	source $ZDOTDIR/zshaliases
else
	print "Note: `$ZDOTDIR`/zshaliases is unavailable."
fi

# Test and then source ZLE configuration
#if [ -f $ZDOTDIR/zshoptions.new ]; then
#	source $ZDOTDIR/zshoptions.new
#else
#	print "Note: `$ZDOTDIR`/zshoptions.new is unavailable."
#fi
#
## Test and then source options
#if [ -f $ZDOTDIR/zshoptions.new ]; then
#	source $ZDOTDIR/zshoptions.new
#else
#	print "Note: `$ZDOTDIR`/zshoptions.new is unavailable."
#fi
#
## Test and then source options
#if [ -f $ZDOTDIR/zshoptions.new ]; then
#	source $ZDOTDIR/zshoptions.new
#else
#	print "Note: `$ZDOTDIR`/zshoptions.new is unavailable."
#fi
