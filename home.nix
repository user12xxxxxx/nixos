{ config, pkgs, inputs, lib, ... }:

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
    nixd
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
  ];
  
  enabledExtensions = [
    "appindicatorsupport@rgcjonas.gmail.com"
    "caffeine@patapon.info"
    "clipboard-indicator@tudmotu.com"
    "color-picker@tuberry"
    "gnome-ui-tune@itstime.tech"
    "gsconnect@andyholmes.github.io"
    "just-perfection-desktop@just-perfection"
    # "pomodoro@arun.codito.in"
    "static-workspace-background@CleoMenezesJr.github.io"
    "Vitals@CoreCoding.com"
    "lomotion@lorens.com"
    "screentospace@dilzhan.dev"
  ];

in
{
  home = {
    username = "nautesh";
    homeDirectory = "/home/nautesh";
    stateVersion = "25.11"; 
    packages = userPkgsTui ++ userPkgsGui ++ userCursors ++ gnomeExtensions;
  };
  
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      settings = {
        user = {
          name = "user12xxxxxx";
          email = "nauteshkanojiya@gmail.com";
        };
        init.defaultBranch = "main";
      };
    };
  };
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = enabledExtensions;
      };
      "org/gnome/shell/extensions/appindicator" = {
        legacy-tray-enabled = false;
      };
      "org/gnome/shell/extensions/caffeine" = {
        restore-state = true;
        enable-fullscreen = false;
        show-notifications = false;
      };
      # "org/gnome/shell/extensions/color-picker" = {
      # };
      "org/gnome/shell/extensions/gnome-ui-tune" = {
        increase-thumbnails-size = "400%";
      };
      "org/gnome/shell/extensions/just-perfection" = {
        dash = false;
      };
      "org/gnome/shell/extensions/clipboard-indicator" = {
        toggle-menu = [ "<Super>v" ];
      };
      "org/gnome/shell/extensions/vitals" = {
        update-time = 1;
        show-fan = false;
        icon-style = 1;
        show-battery = true;
        hot-sensors = [ "_memory_usage_" "_processor_usage_" "__network-rx_max__" ];
        menu-centered = true;
      };
      "org/gnome/shell/extensions/color-picker" = {
        enable-format = true;
      };
      # "org/gnome/desktop/sound" = {
      #   event-sounds = false;
      # };
    };
  };
}