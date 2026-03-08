{ ... }:

{
programs.fish = {
    enable = true;
    shellAliases = {
      grep = "grep --color=auto";
      f = "yazi";
      mc = "micro";
      b = "btop --force-utf";
      c = "clear";
      gt = "git add . && git commit -m 'test'";
      gc = "git add . && git commit";
      gr = "git reset --soft origin/main";
      jctl = "journalctl -p 3 -xb";
      
      ls = "eza -al --color=always --group-directories-first "; # my preferred listing
      la = "aeza -a --color=always --group-directories-first ";  # all files and dirs
      ll = "eza -l --color=always --group-directories-first ";  # long format
      lt = "eza -aT --color=always --group-directories-first "; # tree listing
      lz = "eza -al --color=always --group-directories-first ../ "; # ls on the PARENT directory
      lzz = "eza -al --color=always --group-directories-first ../../ "; # ls on directory 2 levels up
      lzzz = "eza -al --color=always --group-directories-first ../../../ "; # ls on directory 3 levels up
    };
    
    interactiveShellInit = ''
      set TERM "xterm-256color"
      set EDITOR "micro"       
      set VISUAL "zeditor ."
      set -g fish_greeting ""
      set -x MANPAGER "less"

      set -gx ATUIN_NOBIND "true"
      atuin init fish | source
      bind \cr _atuin_search
      bind -M insert \cr _atuin_search
    '';
    
    functions = {
      fish_prompt = {
        body = ''
          set -l last_status $status
          set -l cyan (set_color -o cyan)
          set -l yellow (set_color -o yellow)
          set -g red (set_color -o red)
          set -g blue (set_color -o blue)
          set -l green (set_color -o green)
          set -g normal (set_color normal)

          set -l ahead (_git_ahead)
          set -g whitespace ' '

          if test $last_status = 0
            set initial_indicator "$green◆"
            set status_indicator "$normal❯$cyan❯$green❯"
          else
            set initial_indicator "$red✖ $last_status"
            set status_indicator "$red❯$red❯$red❯"
          end
          set -l cwd $cyan(basename (prompt_pwd))

          if [ (_git_branch_name) ]

            if test (_git_branch_name) = 'master'
              set -l git_branch (_git_branch_name)
              set git_info "$normal git:($red$git_branch$normal)"
            else
              set -l git_branch (_git_branch_name)
              set git_info "$normal git:($blue$git_branch$normal)"
            end

            if [ (_is_git_dirty) ]
              set -l dirty "$yellow ✗"
              set git_info "$git_info$dirty"
            end
          end

          # Notify if a command took more than 5 minutes
          if [ "$CMD_DURATION" -gt 300000 ]
            echo The last command took (math "$CMD_DURATION/1000") seconds.
          end

          echo -n -s $initial_indicator $whitespace $cwd $git_info $whitespace $ahead $status_indicator $whitespace
        '';
      };
    
      _git_ahead = {
        body = ''
          set -l commits (command git rev-list --left-right '@{upstream}...HEAD' 2>/dev/null)
          if [ $status != 0 ]
            return
          end
          set -l behind (count (for arg in $commits; echo $arg; end | grep '^<'))
          set -l ahead  (count (for arg in $commits; echo $arg; end | grep -v '^<'))
          switch "$ahead $behind"
            case '''      # no upstream  <--- THIS IS THE FIX
            case '0 0'  # equal to upstream
              return
            case '* 0'  # ahead of upstream
              echo "$blue↑$normal_c$ahead$whitespace"
            case '0 *'  # behind upstream
              echo "$red↓$normal_c$behind$whitespace"
            case '*'    # diverged from upstream
              echo "$blue↑$normal$ahead $red↓$normal_c$behind$whitespace"
          end
        '';
      };
      
      _git_branch_name = {
        body = ''
          echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
        '';
      };
    
      _is_git_dirty = {
        body = ''
          echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
        '';
      };
    };
  };
}