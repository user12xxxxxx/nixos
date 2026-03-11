{ pkgs, inputs, ... }:
  
let
  # inherit (lib.hm.gvariant) mkUint32;
  
  unstable = import inputs.unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
  
  userPkgsTui = with pkgs; [
    bat 
    unstable.btop 
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
    # telegram-desktop
    # valent
    gnome-extension-manager
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    # blackbox-terminal
    ghostty
    refine
  ];
  
  gnomeExtensions = with pkgs.gnomeExtensions; [
    gsconnect	
    static-workspace-background
    just-perfection
    color-picker
    appindicator
    caffeine
    clipboard-indicator
    gnome-40-ui-improvements
    vitals
    launch-new-instance
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
      ./modules/zed.nix
      ./modules/git.nix
      ./modules/atuin.nix
      ./modules/configSync.nix
    ];
  
  programs = {
    home-manager.enable = true;
  };
}