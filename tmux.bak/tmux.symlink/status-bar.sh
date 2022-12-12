# get colour declarations
source ./colours.sh

# Status Line
# {{{

# Enable utf8
set -g status-utf8 on

# Set text justification
set -g status-justifty left

# }}}

# Colours
# {{{
# Background colour
set -g status-bg default

# Forground colour
set -g status-fg $fg00

# }}}

# Messaging
# {{{

# Message background colour
set -g message-bg $bg_01

# Message foreground colour
set -g message-fg $fg_01

# Message background colour
set -g message-command-bg $bg_01

# Message foreground colour
set -g message-command-fg $fg_01

# }}}

# window mode

# vim: set fdm=marker
