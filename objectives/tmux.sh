# Turns off the mouse within the tmux session
# (so now wetty can use browser/system mouse to
# select and copy/paste text), but now you can't select
# between the top/bottom panes
tmux set -g mouse off

# This binds page up to select the top pane;
# page down to select the bottom pane
tmux bind-key -T root PageUp select-pane -t 0
tmux bind-key -T root PageDown select-pane -t 1

# To re-enable mouse
tmux set -g mouse on
