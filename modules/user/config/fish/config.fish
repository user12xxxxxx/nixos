set -U fish_greeting
set -gx ATUIN_NOBIND true
set -gx DIRENV_LOG_FORMAT ""
atuin init fish | source
bind \cr _atuin_search
bind -M insert \cr _atuin_search

# set TERM xterm-256color
set EDITOR hx
set VISUAL hx
set -g fish_greeting ""
set -x MANPAGER less

alias b 'btop --force-utf'
alias q exit
alias c clear
alias cat bat
alias f yazi
alias gc 'git add . && git commit'
alias gr 'git reset --soft origin/main'
alias grep 'grep --color=auto'
alias gt 'git add . && git commit -m '\''test'\'''
alias jctl 'journalctl -p 3 -xb'
alias ll 'eza -a --color=always --group-directories-first '
alias mc micro
alias sr '$HOME/.hp14/modules/user/config/gnomeSync.sh && sudo nixos-rebuild switch --flake ~/.hp14#nixos-nvm'
alias gsr 'cd $HOME/.hp14/ && gr && gt && sr && cd'
function fish_prompt
    # Capture the last command's status first
    set -l last_status $status

    # Define colors
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l blue (set_color -o blue)
    set -l green (set_color -o green)
    set -l normal (set_color normal)

    set -l whitespace ' '

    # Notify if a command took more than 5 minutes
    if test "$CMD_DURATION" -gt 300000
        echo The last command took (math "$CMD_DURATION/1000") seconds.
    end

    # 1. Tmux Info
    set -l tmux_info (_tmux_session)
    set -l tmux_prompt ""
    if test -n "$tmux_info"
        set tmux_prompt "$green$tmux_info$normal ❯ "
    end

    # 2. Status & Failure Indicators
    set -l failure_indicator ""
    set -l status_indicator ""

    if test $last_status -eq 0
        set status_indicator "$normal❯$cyan❯$green❯"
    else
        set failure_indicator "$red✖ $last_status$normal "
        set status_indicator "$red❯$red❯$red❯"
    end

    # 3. Current Working Directory (CWD)
    set -l cwd "$cyan"(basename (prompt_pwd))"$normal"

    # 4. Git Info
    set -l git_info ""
    set -l git_branch (_git_branch_name)

    if test -n "$git_branch"
        set -l branch_color $blue
        # Color master/main branch red, others blue
        if test "$git_branch" = "master" -o "$git_branch" = "main"
            set branch_color $red
        end

        set git_info "$normal git:($branch_color$git_branch$normal)"

        # Check if git is dirty
        set -l is_dirty (_is_git_dirty)
        if test -n "$is_dirty"
            set git_info "$git_info$yellow ✗$normal"
        end
    end

    # 5. Git Ahead/Behind
    set -l ahead (_git_ahead)
    if test -n "$ahead"
        set ahead " $ahead"
    end

    # 6. Construct and echo the final prompt string
    echo -n -s $tmux_prompt $failure_indicator $cwd $git_info $ahead $whitespace $status_indicator $whitespace
end

function _git_ahead
    set -l commits (command git rev-list --left-right '@{upstream}...HEAD' 2>/dev/null)
    if test $status -ne 0
        return
    end
    set -l behind (count (for arg in $commits; echo $arg; end | grep '^<'))
    set -l ahead (count (for arg in $commits; echo $arg; end | grep -v '^<'))
    switch "$ahead $behind"
        case ''
        case '0 0'
            return
        case '* 0'
            echo "$blue↑$normal$ahead"
        case '0 *'
            echo "$red↓$normal$behind"
        case '*'
            echo "$blue↑$normal$ahead $red↓$normal$behind"
    end
end

function _git_branch_name
    echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
end

function _tmux_session
    if set -q TMUX
        # Get session name
        set -l session (tmux display-message -p '#S')

        # # Get current window index directly (respects your tmux base-index)
        # set -l current (tmux display-message -p '#I')

        # # Count total windows robustly by listing them and piping to Fish's count
        # set -l total (tmux list-windows 2>/dev/null | count)

        echo "$session"
    end
end
