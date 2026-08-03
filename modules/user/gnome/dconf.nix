{ config, lib, pkgs, ... }:

let
  enabledExtensions = [
    # "mosaicwm@cleomenezesjr.github.io"
    "caffeine@patapon.info"
    "just-perfection-desktop@just-perfection"
    "static-workspace-background@CleoMenezesJr.github.io"
    "Vitals@CoreCoding.com"
    # "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
    # "copyous@boerdereinar.dev"
    # "mouse-warp@acristoffers.me"
    # "valent@andyholmes.ca"
  ];

  gnomeExtensions = with pkgs.gnomeExtensions; [
    just-perfection
    color-picker
    caffeine
    launch-new-instance
    # valent
    copyous
    wallpaper-slideshow
    mouse-warp
    vitals
  ];
in
{
  home.packages = gnomeExtensions ;
  imports = [
    ./settings/extensions.nix
    ./settings/interface.nix
    ./settings/wm.nix
    ./settings/mutter.nix
    ./settings/peripherals.nix
    ./settings/customKeybinds.nix
    ./settings/customKeybinds.nix
  ];
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = enabledExtensions;
      };
    };
  };
}
