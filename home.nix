{ pkgs, inputs, ... }:
  
let
  userPkgsTui = with pkgs; [
    bat 
    btop 
    nh 
    fish
    scrcpy 
    yazi
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
  ];
  
  gnomeExtensions = with pkgs.gnomeExtensions; [
    static-workspace-background
    just-perfection
    color-picker
    appindicator
    caffeine
    clipboard-indicator
    gnome-40-ui-improvements
    vitals
    launch-new-instance
    valent
  ];
in
{
  home = {
    username = "nautesh";
    homeDirectory = "/home/nautesh";
    stateVersion = "25.11"; 
    packages = userPkgsTui ++ userPkgsGui ++ userCursors ++ gnomeExtensions;
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
    ];
  
  programs = {
    home-manager.enable = true;
  };
}
