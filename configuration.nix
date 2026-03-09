{ pkgs, inputs, ... }:

let
  unstable = import inputs.unstable {
      system = pkgs.stdenv.hostPlatform.system;
      config.allowUnfree = true; 
  }; 
in
{
  imports =
    [ ./hardware-configuration.nix ];
    
  swapDevices = [
    {
      device="/dev/disk/by-uuid/419d433e-2ff1-4359-87ad-ecd397133677";
      priority = 100;
    }
  ];
  
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
    # steam.enable = true;
    nautilus-open-any-terminal = {
        enable = true;
        terminal = "blackbox";
    };
  };

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d";
    };
  };

  users.users.nautesh = {
    isNormalUser = true;
    description = "nautesh";
    extraGroups = [ "networkmanager" "wheel" ];
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
    unstable.ptyxis
    micro-with-wl-clipboard
  ];
  
  environment.variables = {
    EDITOR = "micro";
    SYSTEMD_EDITOR = "micro";
    VISUAL = "micro";
  };

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
    epiphany    # web browser
    simple-scan # document scanner
    yelp        # help viewer
    geary       # email client
    seahorse    # password manager
    ]);
 
  networking.firewall.enable = false;
  system.stateVersion = "24.05"; # Did you read the comment?
}