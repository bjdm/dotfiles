# Import colour declarations
source ~/.dotfiles/tmux/tmux.symlink/colours.sh


# Special Character Declarations ----------------------------------------------
# {{{
tm_icon="♟"
tm_color_active='#222222'
tm_color_inactive='#000000'
tm_color_feature='#444444'
tm_color_music='#666666'

# separators
tm_separator_left_bold="◀"
tm_separator_left_thin="❮"
tm_separator_right_bold="▶"
tm_separator_right_thin="❯"
# }}}

# Panes ----------------------------------------------
# {{{

# Borders
set-option -g pane-border-fg $neutral_blue
set-option -g pane-border-bg $muted_blue

set-option -g pane-active-border-fg $neutral_purple
set-option -g pane-active-border-bg $pale_purple



## Display panes command
# {{{
### Use display-panes or displayp to show pane identifiers

# Set colour used by display-panes command to show indicator for active pane
set-option -g display-panes-active-colour $light_blue

# Set colour used by display-panes command to show indicator for inactive pane
set-option -g display-panes-colour $muted_blue

# Set duration(ms) of on-screen indicators for display-panes
set-option -g display-panes-time 1000

# }}}

# }}}

# Windows ----------------------------------------------
# {{{

# default window title colors
set-window-option -g window-status-fg $tm_color_inactive
set-window-option -g window-status-bg default
set -g window-status-format "#I #W"

# active window title colors
set-window-option -g window-status-current-fg $tm_color_active
set-window-option -g window-status-current-bg default
set-window-option -g  window-status-current-format "#[bold]#I #W"

# }}}

# Status line ----------------------------------------------
# {{{

# Set lengths
set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# Status line colours
set -g status-fg white
set -g status-bg $light0

# Status line colours?
set-option -g status-attr default

## Clock
# {{{
## Set colour of clock
set-window-option -g clock-mode-colour $tm_color_active

## Set clock hour format ie. 12/24
set-option -g clock-mode-style 24
# }}}

## Custom status line elements
# {{{
tm_spotify="#[fg=$tm_color_music]#(osascript ~/.dotfiles/applescripts/spotify.scpt)"
tm_rdio="#[fg=$tm_color_music]#(osascript ~/.dotfiles/applescripts/rdio.scpt)"
tm_battery="#(~/.dotfiles/bin/battery_indicator.sh)"

tm_date="#[fg=$tm_color_inactive] %R %d %b"
tm_host="#[fg=$tm_color_feature,bold]#h"
tm_session_name="#[fg=$tm_color_feature,bold]$tm_icon #S"

# }}}

set -g status-left $tm_session_name' '
set -g status-right $tm_rdio' '$tm_spotify' '$tm_date' '$tm_host

# }}}

# Messages ----------------------------------------------
# {{{
# Text
set-option -g message-bg default
set-option -g message-fg $tm_color_active

# Set duration (ms) of message display
set-option -g display-time 2000

# }}}


