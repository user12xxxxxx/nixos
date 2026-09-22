# Atuin
if status is-interactive
    atuin init fish | source
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search
end

# Tmux Sessionizer (Runs on Terminal Startup)
# if status is-interactive
#     and not set -q TMUX
#     exec bash $HOME/.config/tmux/scripts/sessionizer.sh
# end

# function q --description "Smart quit: detach tmux or exit terminal"
#     if set -q TMUX
#         tmux kill-pane -t .
#     else
#         exit
#     end
# end
