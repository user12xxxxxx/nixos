#!/usr/bin/env bash

# 1. Format the output to show: "session_name - X windows"
SESSION_FMT="#{session_name} - #{session_windows} windows"

# 2. Build a supercharged preview command
PREVIEW_CMD="echo -e '\e[1;34m[ Windows & Panes ]\e[0m'; \
tmux list-panes -s -t {1} -F ' 🔹 Win #{window_index}:#{window_name} ➜ Pane #{pane_index} [#{pane_current_command}]'; \
echo -e '\n\e[1;34m[ Active Pane Preview ]\e[0m'; \
tmux capture-pane -ep -t {1}"

# 3. Run fzf with the new multi-line preview
selected=$(tmux list-sessions -F "$SESSION_FMT" 2>/dev/null | fzf \
  --reverse \
  --print-query \
  --prompt="Sessions ❯ " \
  --header="Enter: Switch/Create | Ctrl-x: Kill" \
  --preview="$PREVIEW_CMD" \
  --preview-window="right:60%:border-left" \
  --bind="ctrl-x:execute-silent(tmux kill-session -t {1})+reload(tmux list-sessions -F '$SESSION_FMT')")

# 4. Check if the user cancelled (pressed Esc)
[ -z "$selected" ] && exit 0

query=$(echo "$selected" | head -n 1)
target_raw=$(echo "$selected" | tail -n 1)

# 5. Handle the user's action
# if [ "$target_raw" != "$query" ] && [ -n "$target_raw" ]; then
#   session_name=$(echo "$target_raw" | awk '{print $1}')
#   tmux switch-client -t "$session_name"
# elif [ -n "$query" ]; then
#   tmux new-session -d -s "$query"
#   tmux switch-client -t "$query"
# fi

# 5. Handle the user's action (Smart Inside/Outside Tmux Routing)
if [ "$target_raw" != "$query" ] && [ -n "$target_raw" ]; then
  # They selected an existing session
  session_name=$(echo "$target_raw" | awk '{print $1}')

  if [ -n "$TMUX" ]; then
    tmux switch-client -t "$session_name"
  else
    exec tmux attach-session -t "$session_name"
  fi

elif [ -n "$query" ]; then
  # They typed a new session name to create
  if [ -n "$TMUX" ]; then
    tmux new-session -d -s "$query"
    tmux switch-client -t "$query"
  else
    exec tmux new-session -s "$query"
  fi
fi
