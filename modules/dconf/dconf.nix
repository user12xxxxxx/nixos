{ config, lib, ... }:

let
  enabledExtensions = [
    "caffeine@patapon.info"
    "just-perfection-desktop@just-perfection"
    "static-workspace-background@CleoMenezesJr.github.io"
    "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
    "copyous@boerdereinar.dev"
    # "valent@andyholmes.ca"
  ];
in
{
  imports = [
    ./extensions.nix
    ./interface.nix
    ./wm.nix
    ./mutter.nix
    ./periferals.nix
    ./custumKeybinds.nix
    ./shell-keybinds.nix
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
