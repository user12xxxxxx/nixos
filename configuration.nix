{ pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix 
    ./modules/keyd.nix
  ];
    
  swapDevices = [{
    device="/dev/disk/by-uuid/419d433e-2ff1-4359-87ad-ecd397133677";
    priority = 100;
  }];
  
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
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
  i18n.defaultLocale = "en_IN";

  services = {
  	displayManager.gdm.enable = true;
  	desktopManager.gnome.enable = true;

  	immich = {
  	  enable = true;
  	  port = 2283;
  	  host = "0.0.0.0";
      openFirewall = true;
      machine-learning.enable = false;
  	  mediaLocation = "/run/media/nautesh/newVolume/backup";
  	};
  	
  	printing.enable = true;
  	flatpak.enable = true;

  	pipewire = {
 	    enable = true;
 	    alsa.enable = true;
 	    alsa.support32Bit = true;
 	    pulse.enable = true;
 	    wireplumber.enable = true;
    };
  };
  
  security.rtkit.enable = true;
  programs = {
    appimage.enable = true;
    appimage.binfmt = true;
    firefox.enable = true;
    nix-ld.enable = true;
  };

  xdg.terminal-exec.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  users.users.immich.extraGroups = [ "video" "render" ];
  users.users.nautesh = {
    isNormalUser = true;
    description = "nautesh";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFkm0aJHFhElwpNRTVAW1tQ2P39xqpvG4iDpUDMjFrcu nauteshkanojiya@gmail.com"
    ];
  };

  fonts.packages = with pkgs; [
  	nerd-fonts.jetbrains-mono
  	noto-fonts
  	noto-fonts-color-emoji
  	jetbrains-mono
  	font-awesome
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
    pkgs.gnome-connections
    showtime
    epiphany    # web browser
    simple-scan # document scanner
    yelp        # help viewer
    geary       # email client
    seahorse    # password manager
  ]);
 
  networking.firewall.enable = true;
  system.stateVersion = "24.05"; # Did you read the comment?
}
