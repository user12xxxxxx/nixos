function _git_ahead
    set -l commits (command git rev-list --left-right '@{upstream}...HEAD' 2>/dev/null)
    if test $status -ne 0
        return
    end

    # Define colors locally since this runs independently of fish_prompt
    set -l blue (set_color -o blue)
    set -l red (set_color -o red)
    set -l normal (set_color normal)

    set -l behind (count (for arg in $commits; echo $arg; end | grep '^<'))
    set -l ahead (count (for arg in $commits; echo $arg; end | grep -v '^<'))

    switch "$ahead $behind"
        case '' '0 0'
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
        set -l session (tmux display-message -p '#S')
        echo "$session"
    end
end
