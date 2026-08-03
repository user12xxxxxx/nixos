# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      left-handed = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "fingers";
      edge-scrolling-enabled = false;
      left-handed = "mouse";
      two-finger-scrolling-enabled = true;
    };

  };
}
