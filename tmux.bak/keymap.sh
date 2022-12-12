# Keymaps

# change prefix to Ctrl+a (maybe change to Ctrl+f)
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# for nested tmux sessions
bind-key a send-prefix

# reload config file
bind r source-file ~/.tmux.conf \; display "Config reloaded..."

# quickly open a new window
bind N new-window

# split window and fix path for tmux 1.9
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# tile all windows horizontally
unbind =
bind = select-layout tiled

# synchronize all panes in a window
bind y setw synchronize-panes

# pane movement shortcuts
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind -r C-h select-window -t :-
bind -r C-l select-window -t :+

# resize pane shortcuts
bind -r H resize-pane -L 10
bind -r J resize-pane -D 10
bind -r K resize-pane -U 10
bind -r L resize-pane -R 10

# Fullscreen and restore windows
unbind Up
bind Up new-window -d -n fullscreen \; swap-pane -s fullscreen.1 \; select-window -t fullscreen
unbind Down
bind Down last-window \; swap-pane -s fullscreen.1 \; kill-window -t fullscreen

# set vi key movements for copy mode
setw -g mode-keys vi

# more settings to make copy-mode more vim-like
unbind [
bind Escape copy-mode
unbind p
bind p paste-buffer
bind -t vi-copy 'v' begin-selection
bind -t vi-copy 'y' copy-selection
