{ pkgs, inputs, unstable, ... }:

let
  userPkgsTui = with pkgs; [
    bat
    btop
    nh
    fish
    scrcpy
    yazi
    ncdu
    gnome-pomodoro
    adw-gtk3
    eza
  ];

  userCursors = with pkgs; [
    bibata-cursors
    google-cursor
  ];

  userPkgsGui = with pkgs; [
    amberol
    packet
    pika-backup
    kdePackages.kdenlive
    onlyoffice-desktopeditors
    telegram-desktop
    # valent
    gnome-extension-manager
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    ghostty
    refine
    cine
  ];

  gnomeExtensions = with pkgs.gnomeExtensions; [
    just-perfection
    color-picker
    caffeine
    launch-new-instance
    # valent
    copyous
    wallpaper-slideshow
  ];
in
{
  home = {
    username = "nautesh";
    homeDirectory = "/home/nautesh";
    stateVersion = "25.11";
    packages = userPkgsTui ++ userPkgsGui ++ userCursors ++ gnomeExtensions;
    sessionVariables = {
      EDITOR = "helix";
      VISUAL = "zed";
    };
  };

  imports = [
    ./modules/dconf.nix
    ./modules/btop.nix
    ./modules/drv.nix
    ./modules/git.nix
    ./modules/atuin.nix
    ./modules/configSync.nix
    ./modules/helix.nix
    ./modules/xdg.nix
    ./modules/zed.nix
  ];

  programs = {
    home-manager.enable = true;
  };
}
