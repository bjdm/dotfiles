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

#bind -r C-h select-window -t :-
#bind -r C-l select-window -t :+

# Smart pane switching with awareness of Vim splits.
# See: https://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
# See: https://github.com/christoomey/vim-tmux-navigator
unbind C-h
unbind C-k
unbind C-j
unbind C-l
bind h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-3) || tmux select-pane -L"
bind j run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-1) || tmux select-pane -D"
bind k run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-2) || tmux select-pane -U"
bind l run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-4) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l"


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
# TODO
#bind -t vi-copy 'v' begin-selection
#bind -t vi-copy 'y' copy-selection
