function fish_prompt
    set -l last_status $status
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l blue (set_color -o blue)
    set -l green (set_color -o green)
    set -l normal (set_color normal)
    set -l whitespace ' '

    if test "$CMD_DURATION" -gt 300000
        echo The last command took (math "$CMD_DURATION/1000") seconds.
    end

    set -l tmux_info (_tmux_session)
    set -l tmux_prompt ""
    if test -n "$tmux_info"
        set tmux_prompt "$green$tmux_info$normal ❯ "
    end

    set -l failure_indicator ""
    set -l status_indicator ""
    if test $last_status -eq 0
        set status_indicator "$normal❯$cyan❯$green❯"
    else
        set failure_indicator "$red✖ $last_status$normal "
        set status_indicator "$red❯$red❯$red❯"
    end

    set -l cwd "$cyan"(basename (prompt_pwd))"$normal"

    set -l git_info ""
    set -l git_branch (_git_branch_name)
    if test -n "$git_branch"
        set -l branch_color $blue
        if test "$git_branch" = "master" -o "$git_branch" = "main"
            set branch_color $red
        end

        set git_info "$normal git:($branch_color$git_branch$normal)"

        set -l is_dirty (_is_git_dirty)
        if test -n "$is_dirty"
            set git_info "$git_info$yellow ✗$normal"
        end
    end

    set -l ahead (_git_ahead)
    if test -n "$ahead"
        set ahead " $ahead"
    end

    echo -n -s $tmux_prompt $failure_indicator $cwd $git_info $ahead $whitespace $status_indicator $whitespace
end
