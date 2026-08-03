{ pkgs, inputs, unstable, ... }:

let
  userPkgsTui = with pkgs; [
    adw-gtk3
    bat
    btop
    eza
    fish
    fzf
    lazygit
    nh
    ncdu
    scrcpy
    tmux
    wl-clipboard
    yazi
  ];

  userCursors = with pkgs; [
    bibata-cursors
    google-cursor
  ];

  userPkgsGui = with pkgs; [
    amberol
    pika-backup
    telegram-desktop
    gnome-extension-manager
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    ghostty
    gradia
    cine
    packet
  ];

in
{
  home = {
    username = "nautesh";
    homeDirectory = "/home/nautesh";
    stateVersion = "25.11";
    packages = userPkgsTui ++ userPkgsGui ++ userCursors;
    # sessionVariables = {
    #   EDITOR = "helix";
    #   VISUAL = "zed";
    # };
  };

  imports = [
    ./gnome/dconf.nix
    ./programs/btop.nix
    ./programs/drv.nix
    ./programs/git.nix
    ./programs/atuin.nix
    ./programs/helix.nix
    ./programs/configSync.nix
    ./programs/xdg.nix
    ./programs/zed.nix
  ];

  programs = {
    home-manager.enable = true;
  };

  systemd.user.services.tmux-autosave = {
    Unit = {
      Description = "Auto-save tmux environment via tmux-resurrect";
    };
    Service = {
      Type = "oneshot";
      # Ensure the path perfectly matches where your TPM plugins are downloaded
      ExecStart = "${pkgs.bash}/bin/bash %h/.config/tmux/plugins/tmux-resurrect/scripts/save.sh";
    };
  };

  systemd.user.timers.tmux-autosave = {
    Unit = {
      Description = "Run tmux-autosave every 5 minutes";
    };
    Timer = {
      OnCalendar = "*:0/05";
      Persistent = true;
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
