alias b 'btop --force-utf'
alias t 'touch'
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
alias a '$HOME/.hp14/modules/user/config/tmux/scripts/session.sh'
