{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./keyd.nix
  ];

  swapDevices = [{
    device="/dev/disk/by-uuid/419d433e-2ff1-4359-87ad-ecd397133677";
    priority = 100;
  }];

  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages;
    kernelParams = ["resume=UUID=419d433e-2ff1-4359-87ad-ecd397133677"];
  };

  fileSystems."/run/media/nautesh/newVolume" = {
    device = "/dev/disk/by-uuid/06FCBB61FCBB4A27";
    fsType = "ntfs";
    options = [ "rw" "nofail" ];
  };

  networking = {
    hostName = "nixos-nvm";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
  	displayManager.gdm.enable = true;
  	desktopManager.gnome.enable = true;

    udev.extraRules = ''
      SUBSYSTEM=="usb", ATTR{idVendor}=="0d28", ATTR{idProduct}=="0204", MODE="0666"
    '';

  	immich = {
  	  enable = true;
  	  port = 2283;
  	  environment.TZ = "Asia/Kolkata";
  	  host = "0.0.0.0";
      openFirewall = true;
      machine-learning.enable = false;
  	  mediaLocation = "/run/media/nautesh/newVolume/backup";
  	};

  	printing.enable = true;
  	flatpak.enable = true;

  	pipewire.enable = true;
  };

  security.rtkit.enable = true;
  programs = {
    appimage.enable = true;
    appimage.binfmt = true;
    # firefox.enable = true;
    nix-ld.enable = true;
    steam.enable = true;
    fish.enable = true;
    # hyprland.enable = true;

    nautilus-open-any-terminal = {
      enable = true;
      terminal = "null";
    };
  };

  xdg.terminal-exec.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 2d";
    };
  };

  users.users.immich.extraGroups = [ "video" "render" ];
  users.users.nautesh = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "nautesh";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
    linger = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFkm0aJHFhElwpNRTVAW1tQ2P39xqpvG4iDpUDMjFrcu nauteshkanojiya@gmail.com"
    ];
  };

  fonts.packages = with pkgs; [
  	nerd-fonts.jetbrains-mono
  	nerd-fonts.victor-mono
  	noto-fonts-cjk-sans
  	noto-fonts-cjk-serif
  	ipafont
  ];

  environment.systemPackages = with pkgs; [
    git
  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome-console
    gnome-text-editor
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-system-monitor
    gnome-weather
    gnome-connections
    showtime
    loupe
    epiphany    # web browser
    simple-scan # document scanner
    yelp        # help viewer
    geary       # email client
    seahorse    # password manager
    decibels
    gnome-software
  ]);

  networking.firewall = rec {
    enable = true;

    allowedTCPPorts = [ 2283 1883 9300 ];
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
  system.stateVersion = "24.05"; # Did you read the comment?
}
