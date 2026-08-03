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
}
