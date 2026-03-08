{ pkgs, inputs, ... }:
  
let
  # inherit (lib.hm.gvariant) mkUint32;
  
  unstable = import inputs.unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
  
  userPkgsTui = with pkgs; [
    atuin 
    bat 
    btop 
    nh 
    fish
    wl-clipboard
    scrcpy 
    yazi
    micro
    gnome-pomodoro
    adw-gtk3
    nil
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
    vscode
    zed-editor
    # valent
    gnome-extension-manager
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    blackbox-terminal
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
    # text-grabber
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
      ./modules/fish.nix
      ./modules/dconf.nix
      ./modules/zed.nix
      ./modules/git.nix
    ];
  
  programs = {
    home-manager.enable = true;
  };
}